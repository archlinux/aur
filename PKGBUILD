# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=usbkvm
pkgver=0.0.19
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
  '4a5f10a7c1d339c570a3410d1d9bc59d0f8de1d5fac4fbff497278831f969164'
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
