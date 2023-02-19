# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r197.e9b4f66
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libx11' 'libpulse' 'nvidia-utils')
optdepends=(
    'nvlax: For recording one or multiple monitors using NvFBC'
)
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('f89ef1946e02a9cb3bf8a9f6c719fd6c49c8e09d44c046131d42fd430d5cb33113fad1761b987942736327bd87b287e9710283fb25b8fef34aac5e1b152934b8')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
