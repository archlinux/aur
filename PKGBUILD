# Maintainer: Leon Mergen <leon@solatis.com>
pkgname=fio-plot
pkgver=1.1.21
pkgrel=1
pkgdesc="Create charts from FIO storage benchmark tool output"
arch=('any')
url="https://github.com/louwrentius/fio-plot/"
license=("BSD")
makedepends=("python-setuptools")
depends=("python" "python-numpy" "python-matplotlib" "python-pillow" "python-pyparsing" "python-pyan3")
provides=('fio-plot' 'bench-fio')

source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/louwrentius/fio-plot/archive/v${pkgver}.tar.gz")

sha256sums=('b21154f99d5837f818bfb52ec5fa64ef5475a1109eb4de34ca0222f29f4916db')
b2sums=('18fc913de1c8d85112f2d475114ae4d436f34dd1ee688584e5622ac961aee0811ed6c125f892aaeaf110ff9167679d8d5ca1b7fc9efefaf3ef57268b03180909')

package() {
  cd "fio-plot-${pkgver}"

  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
