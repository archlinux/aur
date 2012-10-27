# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.1.0
pkgrel=1
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1')
makedepends=('perl')
source=(https://github.com/downloads/jjk-jacky/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8f1e7a1e6dc7af3cb85e263af669979d')

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
