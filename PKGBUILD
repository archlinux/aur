# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vrwm-git
pkgver=r35.4fec9b8
pkgrel=3
pkgdesc='A virtual reality window manager for X11. Supports "unlimited" virtual monitors. WIP.'
arch=('x86_64')
url="https://git.dec05eba.com/vrwm"
license=('GPL3')
makedepends=('sibs')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'libxi')
provides=('vrwm')
conflicts=('vrwm')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vr-window-manager.tar.gz")
sha512sums=('929610852388ca4cb095642392cf3a5bd2b1c07c43e30f6bd04a0dd2978ab33a69a533bb6100b87059f2dee36643e1b99c0ebdb4b06c4bcca8fd7180d7592bdc')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/vrwm" "$pkgdir/usr/bin/vrwm"
  install -Dm644 images/arrow.png "$pkgdir/usr/share/vrwm/images/arrow.png"
}
