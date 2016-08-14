# Maintainer: Florian Pritz <f-p@gmx.at>
# Contributor: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=xautolock
pkgver=2.2
pkgrel=4
pkgdesc="An automatic X screen-locker/screen-saver"
arch=(i686 x86_64)
url="http://ibiblio.org/pub/Linux/X11/screensavers/"
license=('GPL2')
depends=('libxss')
makedepends=('imake')
source=("http://ibiblio.org/pub/Linux/X11/screensavers/$pkgname-$pkgver.tgz")
md5sums=('9526347a202694ad235d731d9d3de91f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  xmkmf
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
}
