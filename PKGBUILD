# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.0.1
pkgrel=1
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="https://bitbucket.org/jjacky/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.0.1')
source=(https://bitbucket.org/jjacky/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('9a9b38379a65e8b077325967a1f63437')

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
