# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=quake2rtx-bin
_pkgname=quake2rtx
pkgver=1.7.0
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
provides=('quake2rtx')
conflicts=('quake2rtx')
replaces=()
source=("https://github.com/NVIDIA/Q2RTX/releases/download/v${pkgver}/q2rtx-${pkgver}-linux.tar.gz" "https://github.com/NVIDIA/Q2RTX/raw/master/setup/q2rtx.png" "https://github.com/NVIDIA/Q2RTX/raw/master/setup/q2rtx.desktop")
sha256sums=('7309ad2f2d062275c651a5c0fc0552427682215a8099472e4778cb61517290f3'
            '6cd3cbcb85b9c5659ae36e5e30e618fe99ee27b5c513eb7ec1e25556bef0a323'
            'f896d23661044c1a0c9cf0ff577d2509d817869bd57dcfe78c9139e8160e75db')

package() {
  mkdir -p "${pkgdir}/usr/share/${_pkgname}/bin"
  cp "${srcdir}/q2rtx"/{changelog.md,license.txt,notice.txt,readme.md} "${pkgdir}/usr/share/${_pkgname}/"
  cp "${srcdir}/q2rtx"/find-retail-paks.sh "${pkgdir}/usr/share/${_pkgname}/bin/"
  cp "${srcdir}/q2rtx"/q2rtx{,ded} "${pkgdir}/usr/share/${_pkgname}/bin/"
  cp -r "${srcdir}/q2rtx/baseq2" "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm755 "${srcdir}/q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/q2rtx/q2rtx.sh" "${pkgdir}/usr/bin/q2rtx"
  install -Dm755 "${srcdir}/q2rtx/find-retail-paks.sh" "${pkgdir}/usr/bin/${_pkgname}-find-retail-paks"
  install -Dm644 \
    "${srcdir}/q2rtx.png" \
    "${pkgdir}/usr/share/pixmaps/q2rtx.png"
  install -Dm644 \
    "${srcdir}/q2rtx.desktop" \
    "${pkgdir}/usr/share/applications/q2rtx.desktop"
}
