# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daniel Isenmann <daniel.isenmann [at] gmx.de>
pkgname=launch
_pkgname='Launch.app'
pkgver=1.0pre1
pkgrel=2
pkgdesc="Launch.app is a small programm for executing applications, based on WINGs library."
url="http://stepmaker.sourceforge.net/launch.html"
arch=('i686' 'x86_64')
license="GPL"
depends=('windowmaker')
options=('!buildflags')
source=("http://downloads.sourceforge.net/sourceforge/stepmaker/$_pkgname-$pkgver.tar.gz")
md5sums=('9b51931c7eefd618348bfd2b2b10a7a7')

build() {
  cd "$srcdir/Launch"
  make
}
package() {
  cd "$srcdir/Launch"
  make PREFIX="$pkgdir/usr/lib/GNUstep/Applications/$_pkgname" install
}
