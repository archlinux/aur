# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=webp-pixbuf-loader
pkgver=0.0.1
pkgrel=3
pkgdesc='WebM GDK Pixbuf Loader library'
arch=('x86_64' 'i686')
url='https://github.com/aruiz/webp-pixbuf-loader'
license=('LGPL')
depends=('gdk-pixbuf2' 'libwebp')
makedepends=('git' 'meson')
source=('git+https://github.com/aruiz/webp-pixbuf-loader.git#tag='$pkgver)
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
