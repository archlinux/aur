# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r174.1ca4dcf
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
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r174.1ca4dcf.tar.gz")
sha512sums=('47d96c315ae86b9402a15ef3f535cb5b7cf5e071fdd17b5f55c2359b2117a351d478805eed00b10a41798f9182d83e9642c725d9094e83a4a0382422d1be463b')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
