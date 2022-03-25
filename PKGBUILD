# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r100.8117c92
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r100.8117c92.tar.gz")
sha512sums=('a711a8ea48db4a5690c7d57c246dcf3242939f4a1c41267b21938acd71416d5520b5f0867f7619ac89524a33f8175bace58a1cc89a7761f795b8f6e6807d9e31')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  echo "Optional: Install NVENC patch and NvFBC patch from https://github.com/keylase/nvidia-patch or nvlax from https://github.com/illnyang/nvlax to be able to record displays/the entire screen"
}
