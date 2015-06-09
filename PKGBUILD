# Contributor: Nicolas Quiénot < niQo at aur >

pkgname=frame
pkgver=2.5.0
pkgrel=1
pkgdesc="Frame handles the buildup and synchronization of a set of simultaneous touches."
arch=(i686 x86_64)
url="https://launchpad.net/frame"
license=(GPL)
depends=('libxi' 'gcc-libs')
makedepends=('xorg-server-devel' 'asciidoc')
provides=('utouch-frame')
conflicts=('utouch-frame')
replaces=('utouch-frame')
options=('!libtool')
source=(http://launchpad.net/$pkgname/trunk/v$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('02baa941091c5d198cd1623b3ad36e68')



build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

