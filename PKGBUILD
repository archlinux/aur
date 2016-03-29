# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=webp-pixbuf-loader
pkgver=20160329
pkgrel=1
pkgdesc='WebM GDK Pixbuf Loader library'
arch=('x86_64' 'i686')
url='https://github.com/aruiz/webp-pixbuf-loader'
license=('GPL')
depends=('gdk-pixbuf2' 'libwebp')
makedepends=('cmake')
install=webp-pixbuf-loader.install
source=("git+https://github.com/aruiz/webp-pixbuf-loader.git#commit=9b92950d49d7939f90ba7413deb7ec6b392b2054")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX:STRING=/usr ..
  make pixbufloader-webp
}

package() {
  cd "$pkgname"/build
  make DESTDIR="$pkgdir/" install/fast
}
