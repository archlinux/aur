# Maintainer: Hao Long <aur@esd.cc>

pkgname=byte
pkgver=0.4.2
pkgrel=1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/alainm23/byte/archive/${pkgver}.tar.gz")
sha256sums=('ea70db7a30f4a6bd4f252016f7cb8359d5b0c250a315ee5cce53e79bc0be055c')

build() {
  cd ${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C build install
}
