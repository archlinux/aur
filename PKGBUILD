# Current Maintainer: necklace <ns@nsz.no>
# Original Packager: necklace <ns@nsz.no>

pkgname=jp2-pixbuf-loader
pkgver=0.0.2
pkgrel=1
pkgdesc='JPEG2000 GDK Pixbuf Loader library'
arch=('x86_64' 'i686')
url='https://notabug.org/necklace/jp2-pixbuf-loader'
license=('LGPL')
depends=('gdk-pixbuf2' 'openjpeg2')
makedepends=('meson')
source=('git+https://notabug.org/necklace/jp2-pixbuf-loader.git#tag='$pkgver)
sha256sums=('SKIP')

build() {
  arch-meson "$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
