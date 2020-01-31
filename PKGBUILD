# Maintainer: Hao Long <aur@esd.cc>

pkgname=byte
pkgver=0.3.1
pkgrel=2
pkgdesc="A Music Player designed for elementary OS"
arch=("x86_64")
url="https://github.com/alainm23/byte"
license=("GPL3")
depends=("elementary-icon-theme"
         "granite"
         "gst-plugins-base-libs"
         "gtk-theme-elementary"
         "taglib")
makedepends=("meson"
             "vala")
source=("https://github.com/alainm23/byte/archive/${pkgver}.tar.gz")
sha256sums=('a55449f7869b999517495154bdb31474e9b04c1e30ba8f8b8b0f6eef6306527c')

build() {
    cd ${pkgname}-${pkgver}
    meson build --prefix=/usr
    ninja -C build
}

package() {
    cd ${pkgname}-${pkgver}
    DESTDIR="$pkgdir" ninja -C build install
}
