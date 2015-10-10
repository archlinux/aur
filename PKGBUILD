# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Cian Mc Govern <cian@cianmcgovern.com>
# Contributor: Ian Abbott <ian at abbott dot org>
# Contributor: Zbyszek Tokarczyk <ztokarczyk at gmail dot com>

pkgname=wally
pkgver=2.4.5
pkgrel=3
pkgdesc="Qt4 desktop wallpaper changer, using multiple online and offline sources"
arch=('i686' 'x86_64')
url="http://www.becrux.com/index.php?page=projects&name=wally"
license=('GPL')
depends=('qt4')
optdepends=('libexif: retrieve EXIF data')
makedepends=('cmake')
source=(http://www.becrux.com/pages/projects/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bd99473b23f42b5158341865fb6aa1bc')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_EXE_LINKER_FLAGS=-lX11 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

