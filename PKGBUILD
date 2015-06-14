# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=vttest
pkgver=20140305
pkgrel=2
pkgdesc="tool for testing VT100 compatibility of terminals"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vttest/"
license=('MIT')
depends=('glibc')
source=(http://invisible-island.net/datafiles/release/$pkgname.tar.gz)
sha512sums=('eee1460c3978fd1e9c08d58eddeb8a21cb4cb8cedb5d523e348de85774c1eff1162757fa4d743ca62539f87499557365ac2f4286bc7da6e0203a85bd9ce56e2f')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  make DESTDIR=$pkgdir mandir="/usr/share/man" install
}
