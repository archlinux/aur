# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=usbkvm
pkgver=0.3.0
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
  '9f1b778bc68f7c066516eb38a92970adbedcf51a5f511bba7b49e5a5b2099b06'
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
