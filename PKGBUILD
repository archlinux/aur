# Maintainer: Hao Long <aur@esd.cc>

pkgname=byte
pkgver=0.4.1
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
sha256sums=('c5b06be1d53ebcc42e8a996a6ea96f021a90b58fc128d6f5a9992fa57b8c9618')

build() {
  cd ${pkgname}-${pkgver}
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="$pkgdir" ninja -C build install
}
