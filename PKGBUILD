# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>
pkgname=ffglitch-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="FFglitch - FFmpeg fork for glitching"
arch=("x86_64")
url="https://ffglitch.org"
license=("GPL-3.0-only")

depends=(
  alsa-lib
  libdrm
  libxcb
  zlib
  libxau
  libxdmcp
  sdl2
)

conflicts=(
  quickjs
)

source=(https://ffglitch.org/pub/bin/linux64/ffglitch-${pkgver}-linux-x86_64.zip)
sha256sums=('28dd39eee7d5be6d6f6b3f126e25563118eb0b47dc174941509f64f90a09bd40')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-linux-x86_64
  install -Dm755 ffedit -t ${pkgdir}/usr/bin/
  install -Dm755 ffgac -t ${pkgdir}/usr/bin/
  install -Dm755 fflive -t ${pkgdir}/usr/bin/
  install -Dm755 qjs -t ${pkgdir}/usr/bin/
  install -Dm755 readme.txt -t ${pkgdir}/usr/share/license/ffglitch
}
