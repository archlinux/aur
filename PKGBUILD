# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=vrwm-git
pkgver=r38.407bd6a
pkgrel=1
pkgdesc='A virtual reality window manager for X11. Supports "unlimited" virtual monitors. WIP.'
arch=('x86_64')
url="https://git.dec05eba.com/vrwm"
license=('GPL3')
makedepends=('sibs')
depends=('glm' 'glew' 'sdl2' 'openvr' 'libx11' 'libxcomposite' 'libxfixes' 'libxi')
provides=('vrwm')
conflicts=('vrwm')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/vrwm.git.r38.407bd6a.tar.gz")
sha512sums=('30443235289734b86f746a381db5ad77e7a3b0c489cabc4a1058c78984f3b524c6687c01f1d4930b533f77ad469320734dfddcb8ae96670bbc66546203815c7e')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/vrwm" "$pkgdir/usr/bin/vrwm"
}
