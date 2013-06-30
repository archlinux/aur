# Maintainer: jjacky
pkgname=kalu
pkgver=2.2.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.1.1' 'pacman<4.2' 'curl' 'libnotify'
         'notification-daemon')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
install=kalu.install
md5sums=('fb321c5681dcab5500defa4dd2f7d93b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
}

# vim:set ts=2 sw=2 et:
