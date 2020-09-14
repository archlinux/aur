# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r64.a7259c6
pkgrel=2
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
makedepends=('sibs')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("gpu-screen-recorder.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.tar.gz")
sha512sums=('614c4574916ca7607ba8b6a52ba60e8c2920d09cabf747140852ea3be39de626ba360311dd8c12b7bcb7f1ed1f53ed32c2a62106f8b7e514896cf0135208f4c1')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
