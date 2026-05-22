# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="nethlink"
_srcname="nethlink"
_srcmntr="NethServer"

pkgname="${_pkgname}-appimage"
pkgver="1.4.5"
pkgrel="1"
pkgdesc="A tool designed to link NethServer systems and provide remote access tools."
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("unknown")
options=("!strip" "!debug")
depends=("fuse2")
_archive="${_pkgname}-${pkgver}.AppImage"
source=(
  "${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
conflicts=("nethlink")
provides=("nethlink")

sha256sums=(
  "d3339c7d172009ae342c9969f4d5c9d6591e3310b146a90e16a1f1b4f880d103"
  "1c5d66ad8406cb12645f26e51d5fdac5ff6ad2a90d392dd852ab027d6783aa54"
  "360ba441787829ab27c306cd0cdb8606d501c210e6d100bc767e2842fde2dc02"
)

package() {
  install -Dm755 "${srcdir}/${_archive}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
}
