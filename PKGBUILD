# Maintainer: jjacky
pkgname=kalu
pkgver=1.0.0
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1' 'pacman<4.1' 'curl' 'libnotify' 'notification-daemon')
source=(https://bitbucket.org/jjacky/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('4f88a4a2c217569fa30544172a3789ab')

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
