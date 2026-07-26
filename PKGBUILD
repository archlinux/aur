# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="reflex"
_srcname="Reflex"
_srcmntr="Sunhaiy"

pkgname="${_pkgname}-appimage"
pkgver="1.0.11"
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
  "0745ea0dbb05213b36541aab9945479dd3e9a46ab78ff481bae979bb825bc350"
  "ee0633f7f8b9d6996eed77120d41c31839891c0177217d38885245491a3156ea"
  "90a0628bd8b3628609e7965d792478cf9f4fcc74a31ef450d0d47148eeb2da0a"
)

package() {
  install -Dm755 "${srcdir}/${_archive}" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/${_pkgname}.desktop" \
    "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "$srcdir/${_pkgname}.png" \
    "$pkgdir/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png"
}
