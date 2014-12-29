# Maintainer: jjacky
pkgname=pkgclip
pkgver=1.2.1
pkgrel=2
pkgdesc="Cached Packages Trimmer Utility"
arch=('i686' 'x86_64')
url="http://jjacky.com/pkgclip"
license=('GPL3+')
depends=('dbus' 'polkit' 'gtk3' 'pacman>=4.2' 'pacman<4.3')
makedepends=('perl')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('054ff626c060b468c70b5ebf261b8f805ff04ab0')

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
