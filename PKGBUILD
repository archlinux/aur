# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r67.4617e2c
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
makedepends=('sibs')
depends=('glew' 'glfw-x11' 'ffmpeg' 'libxcomposite' 'libpulse' 'nvidia-utils' 'cuda' 'libx11')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r67.4617e2c.tar.gz")
sha512sums=('f340bd7e85c0e7482759c790d78af8bd4cd3872b46312e3b5d60dd3c583baa97a1b5c951cc8849a60c8f1e67e1f92cf21a554058ced49a24ef05e4636fd8dd14')

build() {
  cd "$srcdir"
  sibs build --release
}

package() {
  cd "$srcdir"
  install -Dm755 "sibs-build/$(sibs platform)/release/gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  echo "Optional: Install NVENC patch and NvFBC patch to be able to record displays/the entire screen"
}
