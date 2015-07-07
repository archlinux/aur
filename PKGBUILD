# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=cytadela
pkgver=1.1.0
pkgrel=1
pkgdesc="A conversion of a Doom clone for Amiga"
arch=('i686' 'x86_64')
url="http://cytadela.sourceforge.net"
license=('GPL')
depends=('glu' 'sdl_mixer' 'vlc')
changelog=cytadela.changelog
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('2929f667639f7b6beadc6c822a1fde03')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
