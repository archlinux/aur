# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vrwm-git
pkgver=r39.8f1d307
pkgrel=1
pkgdesc='A virtual reality window manager for X11. Supports "unlimited" virtual monitors. WIP.'
arch=('x86_64')
url="https://git.dec05eba.com/vrwm"
license=('GPL3')
makedepends=('sibs')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'libxi')
provides=('vrwm')
conflicts=('vrwm')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vrwm.git.r39.8f1d307.tar.gz")
sha512sums=('b8b39a12be25797ab67f9d7b327447771ce636925035f731640a5caaa7b1a6ea42a8dbb1452221b4c7f11ed67fd495045a2e28295927817a3d653bcde3798ed0')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/vrwm" "$pkgdir/usr/bin/vrwm"
}
