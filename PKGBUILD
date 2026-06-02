# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.8.4
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("libkeybinder3" "libsoup3" "gst-plugins-base" "gst-plugins-bad" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson" "glib2-devel")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8c84acc1e401fba5f2b4cf5e340aebb39423fbefc77db83f5f9fe0615450a813')

build() {
    arch-meson -D tests=false "$pkgname-v$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
