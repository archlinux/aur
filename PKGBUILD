# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# This package is forked from aur/kalu. Original contributors are:
# Contributor: jjacky

_pkgname=kalu
pkgname=${_pkgname}-cli
pkgver=4.2.0
pkgrel=2
pkgdesc="Upgrade notifier w/ AUR support, watched (AUR) packages, news (CLI only)"
arch=('i686' 'x86_64')
url="http://jjacky.com/kalu"
license=('GPL3+')
depends=('pacman>=5.1' 'pacman<5.2' 'curl')
makedepends=('perl' 'groff')
source=(http://jjacky.com/$_pkgname/$_pkgname-$pkgver.tar.gz)
install=kalu.install
sha256sums=('1e46881644da18db52d2d8f1676b3f4e509be511cd93a9c61b80eb65e7da50e4')
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
