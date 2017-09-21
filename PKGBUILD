# Maintainer: jjacky
_pkgname=kalu
pkgname=${_pkgname}-cli
pkgver=4.1.0
pkgrel=2
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('pacman>=5.0' 'pacman<5.1' 'curl')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.gz)
install=kalu.install
sha1sums=('dbcc37899302d402717653f11ff303c5dc73b86d')
conflicts=("$_pkgname")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
