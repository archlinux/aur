# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r68.1f71584
pkgrel=2
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
makedepends=('sibs')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r68.1f71584.tar.gz")
sha512sums=('1ace00424e8800b790d84a77941fb5f09c47ccc6cf66abe3f6f9cdbe7f7fe588312c40db0300986d34c7a2efdc68a17fa3a5e29e8b97bf8bb3e890aeb37ded35')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  echo "Optional: Install NVENC patch and NvFBC patch from https://github.com/keylase/nvidia-patch to be able to record displays/the entire screen"
}
