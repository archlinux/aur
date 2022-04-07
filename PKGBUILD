# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r109.066cfae
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r109.066cfae.tar.gz")
sha512sums=('16f075afd36ba9d8a35185bf56d142b8ad6a4d2f4c6e0edb0e170b0af809d860fbd67d485f2c6ef4c6ac0de8397b42572197c2c771e8f9f1feede7b3385291f1')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  echo "Optional: Install NVENC patch and NvFBC patch from https://github.com/keylase/nvidia-patch or nvlax from https://github.com/illnyang/nvlax to be able to record displays/the entire screen"
}
