# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

_pkgname=sqlclient
pkgname=sqlclient
pkgrel=1
pkgver=1.7.3
pkgdesc='Provides a simple interface to SQL databases for GNUstep applications'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gnustep/libs-sqlclient'
license=('GPL')
groups=('gnustep-libs')
depends=('gnustep-base' 'performance')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://github.com/gnustep/libs-sqlclient/archive/sqlclient-1_7_3.tar.gz")
sha256sums=('79eba1fef438fdc6b72bc3801e5058787d08915e251a6dcc55c1369f72ce61e1')

build() {
  cd "libs-sqlclient-sqlclient-1_7_3"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "libs-sqlclient-sqlclient-1_7_3"
  make DESTDIR="$pkgdir" install
}
