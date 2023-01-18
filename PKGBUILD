# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.7.6
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://gitlab.com/goodvibes/goodvibes"
license=('GPL')
depends=("libkeybinder3" "libsoup" "gst-plugins-base" "gst-plugins-bad" "gst-plugins-good" "gst-plugins-ugly")
makedepends=("meson")
source=("https://gitlab.com/${pkgname}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f88f4252ea08a68dba6fbc9483a2e6b00b6fb96df3f46202ec96da04bf8245e5')

build() {
    arch-meson -D tests=false "$pkgname-v$pkgver" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
