# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-git
pkgver=r214.f242cab
pkgrel=1
pkgdesc='A shadowplay-like screen recorder for Linux. The fastest screen recorder for Linux.'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder"
license=('GPL3')
depends=('ffmpeg' 'libglvnd' 'libxcomposite' 'libx11' 'libxnvctrl' 'libpulse' 'nvidia-utils')
provides=('gpu-screen-recorder')
conflicts=('gpu-screen-recorder')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder.git.${pkgver}.tar.gz")
sha512sums=('b6272eceae1220362dc3f15538f174b3187b31f4874199c4c3d244d21fb3368fe54d72a5f5665a0736ea021b9511c59f6966d5be999fd1419d3597e13ce6d342')

build() {
  cd "$srcdir"
  ./build.sh
}

package() {
  cd "$srcdir"
  install -Dm755 "gpu-screen-recorder" "$pkgdir/usr/bin/gpu-screen-recorder"
  install -Dm644 "88-gsr-coolbits.conf" "$pkgdir/etc/X11/xorg.conf.d/88-gsr-coolbits.conf"
}
