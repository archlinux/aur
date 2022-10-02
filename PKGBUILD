# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r157.0ec31db
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
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.r157.0ec31db.tar.gz")
sha512sums=('c1018332bf9baaf71a4286e32821bf68e117e0d79d1049d0a5fbfb285215232e31db0e1eb42a171841bb6d0d250a888a10158c8e1e8a89bb96bc34bd618c4cae')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
}
