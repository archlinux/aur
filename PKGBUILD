# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=fio-plot
pkgver=1.0.11
pkgrel=1
pkgdesc="Create charts from FIO storage benchmark tool output"
arch=('any')
url="https://github.com/louwrentius/fio-plot/"
license=("BSD")
makedepends=("python-setuptools")
depends=("python" "python-numpy" "python-matplotlib" "python-pillow" "python-pyparsing")
provides=('fio-plot' 'bench-fio')

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/louwrentius/fio-plot/archive/v.${pkgver}.tar.gz")

sha256sums=('4798555f0dc022464f3571ef1ef84ed69d6735250a2bc17f18a3a1f220f8103e')
b2sums=('37d7a8b05f1caa0e004c04e0f9f22d5248ee5d7f2cb8d76347fe985e0d285e3b63b48badf237a701549fd4157e94d3c8bdb68b2ad9a35b09e35d407fbcb09632')

package() {
  cd "fio-plot-v.${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
