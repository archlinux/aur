# Maintainer: Dave Streng (KR4GCQ) <https://github.com/S7R4nG3/refconnect>
# AUR package: refconnect-bin — installs the prebuilt GitHub release tarball.
# Submit to AUR from a checkout of ssh://aur@aur.archlinux.org/refconnect-bin.git :
#   makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO && git commit && git push
pkgname=refconnect-bin
_pkgname=refconnect
pkgver=0.14.0
pkgrel=1
pkgdesc="D-STAR reflector client (REF/XRF/XLX/DCS)"
arch=('x86_64' 'aarch64')
url="https://github.com/S7R4nG3/refconnect"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxxf86vm' 'wayland' 'libxkbcommon')
provides=('refconnect')
conflicts=('refconnect' 'refconnect-git')
# Update the sha256sums below on every release: `makepkg -g >> PKGBUILD`.
source_x86_64=("https://github.com/S7R4nG3/refconnect/releases/download/v${pkgver}/refconnect_linux_amd64.tar.gz")
source_aarch64=("https://github.com/S7R4nG3/refconnect/releases/download/v${pkgver}/refconnect_linux_arm64.tar.gz")
sha256sums_x86_64=('881a6c4e7c7f73573e77b4c091faf9bc45762068df12e785a9aa6e7fc03e94aa')
sha256sums_aarch64=('49fa510cbdf5a33545a32914354832b296a70c14c4bb1481b6b11ecfac191b7e')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
}
