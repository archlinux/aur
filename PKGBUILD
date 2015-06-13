# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
# Contributor: Hubert Maraszek <marach5 at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=xye
pkgver=0.12.2
pkgrel=1
pkgdesc="Puzzle game in which the objective is to help a character that looks like a green circle to get all the gems in the room."
url="http://xye.sourceforge.net/"
license=('GPL')
install=xye.install
arch=('i686' 'x86_64')
depends=('sdl_image' 'sdl_ttf' 'xdg-utils' 'desktop-file-utils')
source=("http://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.gz")
md5sums=('f8a464fe0e67d8292dd32ef18e14ea18')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
