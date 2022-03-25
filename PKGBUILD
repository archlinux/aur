# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r101.5ca83d4
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r101.5ca83d4.tar.gz")
sha512sums=('b9ce4c568fdb48349b50eafc0165a0a986b62460a282ea1c0904667f3daf7bbc8f414edee66df481ae513f39c99ca435abc70dcf8d1d836b93d072ade23ff662')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  echo "Optional: Install NVENC patch and NvFBC patch from https://github.com/keylase/nvidia-patch or nvlax from https://github.com/illnyang/nvlax to be able to record displays/the entire screen"
}
