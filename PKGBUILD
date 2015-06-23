# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=anypaper
pkgver=2.4
pkgrel=1
pkgdesc="Frontend for feh and other wallpaper setting tools."
arch=('i686' 'x86_64')
url="http://anypaper.sourceforge.net"
license=('GPL')
depends=('gtk2' 'libpng' 'feh')
makedepends=('automake' 'autoconf')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('bb6b520725c7842424de2be04a59c541')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

