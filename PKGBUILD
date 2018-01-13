# Maintainer: Artjom Simon <artjom.simon@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=kaption
pkgver=0.1.1
pkgrel=3
pkgdesc="A KDE utility similar to Jing or Skitch to take and edit screenshots"
arch=('i686' 'x86_64')
url="https://store.kde.org/content/show.php/Kaption?content=139302"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1466627852/s/3c558b85e9e6db6eaccc9de92d42acdf/t/1515867855/u//139302-kaption-0.1.1.tar.bz2")
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
