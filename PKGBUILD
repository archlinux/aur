# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Pavel Vyazovoi <vyazovoi@gmail.com>

pkgname="gnome-quod"
pkgver=0.2.3
pkgrel=2
pkgdesc="The object of the game is to outmaneuver your opponent and be the first to outline a square, called a quod, by capturing its four corners with your colored attacking pieces."
arch=('i686' 'x86_64')
url="http://gquod.sourceforge.net/"
license=('GPL')
depends=('gtkmm>=2.10.0' 'librsvg' 'libxml++2>=2.10.0')
makedepends=('intltool>=0.35.0')
source=(http://downloads.sourceforge.net/gquod/$pkgname-$pkgver.tar.gz)
md5sums=('4fdb12ed288e2e519d0736eb77ff5177')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
