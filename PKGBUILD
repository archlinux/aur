# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=usbkvm
pkgver=0.1.0
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
  'ac1aeef6c0bd906662f6c4d3cff158ea45c361a52ef0ae2e025075961786df07'
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
