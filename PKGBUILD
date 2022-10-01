# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r153.5871abc
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libx11' 'libpulse' 'cuda')
optdepends=(
    'nvlax: For recording one or multiple monitors using NvFBC'
)
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r153.5871abc.tar.gz")
sha512sums=('45f69bb81e461c0b60ab3974706e09e6ca383916fb003b7d852d1b53c70614b48994d9743fe609eb83d02101bf2d16ed410515693c18629f1037844b54520eaa')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
