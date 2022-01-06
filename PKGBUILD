# Maintainer: <mumei AT airmail DOT cc>

_pkgname=sqlclient
pkgname=sqlclient
pkgrel=1
pkgver=1.8.1
pkgdesc='Provides a simple interface to SQL databases for GNUstep applications'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gnustep/libs-sqlclient'
license=('GPL')
groups=('gnustep-libs')
depends=('gnustep-base' 'performance')
makedepends=('gcc-objc' 'gnustep-make')
source=(ftp://ftp.gnustep.org/pub/gnustep/libs/SQLClient-$pkgver.tar.gz)
sha256sums=('c6cb9d0033b496b52b698f1f80007b6acd215441683cf1a1c22f67a96198074f')

build() {
  cd "SQLClient-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "SQLClient-$pkgver"
  make DESTDIR="$pkgdir" install
}
