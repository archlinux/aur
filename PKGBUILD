# Maintainer: Tilmann Meyer tilmann.meyer@gmx.net

pkgname=xsb
pkgver=3.8
pkgrel=1
pkgdesc='A Logic Programming and Deductive Database system for Unix and Windows.'
arch=(x86_64)
url='http://xsb.sourceforge.net/'
license=(GPL2)
depends=(bash classpath curl pcre)
makedepends=()
options=(!strip)
source=(
  http://xsb.sourceforge.net/downloads/XSB${pkgver//./}.tar.gz
)
sha256sums=(
  '7cbcc8a178bf386cf0a5c950d9e3977edcbc787fd02f5296f00084c45bbfc1fc'
)

_srcdir=XSB/build

package() {
  cd $_srcdir

  ./configure --prefix="$pkgdir"/usr/share
  ./makexsb

  ./makexsb install
}
