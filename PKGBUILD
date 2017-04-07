# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=kaption
pkgver=0.1.1
pkgrel=3
pkgdesc="A KDE utility similar to Jing or Skitch to take and edit screenshots"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Kaption?content=139302"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=("https://dl.opendesktop.org/api/files/download/id/1466627852/139302-kaption-$pkgver.tar.bz2")
sha256sums=('90d3a8b7f33d3078f788dd257b020a0af32d495792395666726e79325541931d')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
