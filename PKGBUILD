# Maintainer: Can Altıparmak (gulaghad) <can6parmak <AT> gmail <DOT> com>

pkgname=atdtool
pkgver='1.3.3'
pkgrel=1
pkgdesc="After the Deadline command-line tool."
arch=('any')
url="https://github.com/lpenz/atdtool"
license=('BSD')
depends=('python2')
source=("https://github.com/lpenz/atdtool/archive/upstream/$pkgver.tar.gz")
md5sums=('3c8f00073bc5720dd029ab09fb4a1907')
install="${pkgname}.install"

build() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "${srcdir}/${pkgname}-upstream-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

