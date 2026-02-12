# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=usbkvm
pkgver=0.3.1
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
  '2986c2e2d0a543526899b10bc75c989ee5409c2975ccbe49bbaeb6a2036199b7'
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
