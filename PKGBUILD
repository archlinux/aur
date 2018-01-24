# Maintainer: Bert Peters <bert@bertptrs.nl>
# Previously: Jonathan Schaeffer <Joschaeffer@gmail.com>

pkgname=trang
_pkgname="jing-trang"
pkgver=20151127
pkgrel=3
pkgdesc="Converts between different schema languages for XML"
url="https://github.com/relaxng/jing-trang"
arch=('any')
license=('GPL')
depends=(java-runtime)
depends=(java-environment)
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/relaxng/${_pkgname}/archive/V${pkgver}.tar.gz"
	trang
)

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./ant
}

check() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./ant test
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -D -m644 -t "$pkgdir/usr/share/java/$pkgname" build/trang.jar build/jing.jar build/dtdinst.jar
  install -D -m755 "$srcdir/trang" "$pkgdir/usr/bin/trang"
}

sha256sums=('04cdf589abc5651d40f44fbc3415cb094672cb3c977770b2d9f6ea33e6d8932b'
            'bba2c24e1ba844b8646ac1159c30889a6d38e864b1ddc5066a7fc6851a9ec78d')
