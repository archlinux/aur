# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="reflex"
_srcname="Reflex"
_srcmntr="Sunhaiy"

pkgname="${_pkgname}-appimage"
pkgver="1.0.24"
pkgrel="1"
pkgdesc="A next-generation, modern, and lightweight SSH client engineered for absolute efficiency"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
depends=("fuse2")
_archive="${_pkgname}-${pkgver}.AppImage"
source=(
  "${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/v${pkgver}/reflex-${pkgver}-linux-x86_64.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
conflicts=("reflex")
provides=("reflex")

sha256sums=(
  "5bb1359defa70263a0c418730fea730f214d7ed4f764a96124dbd8c0b324482a"
  "a6b3ff91e20406e878b0c844a2296d69b73a04361afe6d6cb7cc115a62ddce39"
  "6cba35916086324e86dfe98f1c4abb9916a842298d6dd8c34106218ae4a87150"
)

package() {
  install -Dm755 "${srcdir}/${_archive}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"
}
