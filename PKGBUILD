# Maintainer: Popolon <popolon@popolon.org>

pkgname=bootterm
pkgver=0.5
pkgrel=1
pkgdesc="Simple, reliable and powerful terminal designed to ease connection to ephemeral serial ports"
arch=('x86_64' 'armv7h' 'armv8')
url="https://github.com/wtarreau/bootterm/"
license=('MIT')
source=(https://github.com/wtarreau/$pkgname/archive/v${pkgver}.tar.gz)
sha256sums=('95cc154236655082fb60e8cdae15823e4624e108b8aead59498ac8f2263295ad')

build() {
  cd $pkgname-$pkgver
  make V=1 CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd $pkgname-$pkgver
  make install DESTDIR="$pkgdir" PREFIX=/usr
}
