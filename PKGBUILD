# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=quake2rtx
pkgver=1.5.0
pkgrel=1
pkgdesc="Ray-traced version of Quake II."
arch=(x86_64)
url="https://github.com/NVIDIA/Q2RTX"
license=('GPL')
groups=()
depends=(zlib curl sdl2 vulkan-headers vulkan-driver)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://github.com/NVIDIA/Q2RTX/releases/download/v${pkgver}/q2rtx-${pkgver}-linux.tar.gz")
md5sums=('a064940abc6dbd8f092424987c810b1a')

package() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}/bin"
  cp -r "q2rtx/"* "${pkgdir}/usr/share/${pkgname}/bin/"
  install -Dm755 "q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/q2rtx"
  install -Dm755 "q2rtx/find-retail-paks.sh" "${pkgdir}/usr/bin/${pkgname}-find-retail-paks"
  install -Dm644 \
    "q2rtx/q2rtx.png" \
    "${pkgdir}/usr/share/pixmaps/q2rtx.png"
  install -Dm644 \
    "q2rtx/q2rtx.desktop" \
    "${pkgdir}/usr/share/applications/q2rtx.desktop"

}
