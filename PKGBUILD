# Maintainer: jjacky
pkgname=kalu
pkgver=0.1.5.1
pkgrel=1
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/kalu"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1' 'pacman<4.1' 'curl' 'libnotify' 'notification-daemon')
source=(https://bitbucket.org/jjacky/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('190100e2234bf56e489b9ee495fe6e0d')

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
