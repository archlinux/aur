# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=usbkvm
pkgver=0.2.0
pkgrel=1
pkgdesc="USBKVM app"
arch=('x86_64' 'i686')
url="https://github.com/carrotIndustries/usbkvm"
license=('GPL')
depends=('gtkmm3' 'gstreamer' 'gst-plugins-good' 'gst-plugin-gtk' 'hidapi')
makedepends=('meson' 'go')
source=(
  "https://github.com/carrotIndustries/usbkvm/releases/download/v${pkgver}/usbkvm-v${pkgver}.tar.gz"
)
sha256sums=(
  'b3f29d4f14a571f1b7a0ea41cb64a2b04d3ea0472bfcf5c22d70fe6e9643552f'
)

build() {
  cd usbkvm
  arch-meson build

  meson compile -C build
}

package() {
    cd usbkvm
    meson install -C build --destdir "$pkgdir"
}
