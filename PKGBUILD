# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=webp-pixbuf-loader
pkgver=20191002
pkgrel=1
pkgdesc='WebM GDK Pixbuf Loader library'
arch=('x86_64' 'i686')
url='https://github.com/aruiz/webp-pixbuf-loader'
license=('GPL')
depends=('gdk-pixbuf2' 'libwebp')
makedepends=('meson')
_commit='fb04954d48425dfa9d7014e733736c1802ba9733'
source=('git+https://github.com/aruiz/webp-pixbuf-loader.git#commit='$_commit)
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
