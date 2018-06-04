# Contributor: Scott Lawrence <bytbox@gmail.com>
# Contributor: Daniel Fiser <danfis (at) danfis (dot) cz>

pkgname=ohcount
pkgver=3.1.0
pkgrel=1
pkgdesc="source-lines of code counter"
arch=(i686 x86_64)
url="http://labs.ohloh.net/ohcount"
license=('GPL')
depends=(pcre)
makedepends=('ragel>=6.3' 'swig' 'ruby' 'rake' 'gperf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/blackducksoftware/ohcount/archive/v${pkgver}.tar.gz")
md5sums=('a6c62adaea3f8b47a731a68d61660f60')


build() {
  cd "$pkgname"

  ./build ohcount
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr/bin"
  cp bin/ohcount "$pkgdir/usr/bin/"
}
