# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=fio-plot
pkgver=1.1.16
pkgrel=1
pkgdesc="Create charts from FIO storage benchmark tool output"
arch=('any')
url="https://github.com/louwrentius/fio-plot/"
license=("BSD")
makedepends=("python-setuptools")
depends=("python" "python-numpy" "python-matplotlib" "python-pillow" "python-pyparsing" "python-pyan3")
provides=('fio-plot' 'bench-fio')

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/louwrentius/fio-plot/archive/v${pkgver}.tar.gz")

sha256sums=('31b23e538c8d2a8a2b373553e01742c171b2b151049253114d93c4f60380a7f9')
b2sums=('f6e63c3ac9deacd37c96bd86bf867bcc96969a39276d07209f3d4d2b1045e921e1de83c10b2691b112633b9b1ddbe70b165068f0bced9ffbc7f06019dc52d15a')

package() {
  cd "fio-plot-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
