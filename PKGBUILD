# Maintainer: jjacky
pkgname=kalu
pkgver=1.2.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="https://github.com/jjk-jacky/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1' 'pacman<4.1' 'curl' 'libnotify' 'notification-daemon' 'xdg-utils')
source=(https://github.com/downloads/jjk-jacky/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('2636827d3d1be6410382ca7be5119bca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
