# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

_pkgname="reflex"
_srcname="Reflex"
_srcmntr="Sunhaiy"

pkgname="${_pkgname}-appimage"
pkgver="1.0.10"
pkgrel="1"
pkgdesc="A next-generation, modern, and lightweight SSH client engineered for absolute efficiency"
url="https://github.com/${_srcmntr}/${_srcname}"
arch=("x86_64")
license=("AGPL3")
options=("!strip" "!debug")
_archive="${_pkgname}-${pkgver}.AppImage"
source=(
  "${_archive}::https://github.com/${_srcmntr}/${_srcname}/releases/download/app-v${pkgver}/Open.Video.Downloader_${pkgver}_amd64.AppImage"
  "${_pkgname}.desktop"
  "${_pkgname}.png"
)
conflicts=("reflex")
provides=("reflex")

sha256sums=(
  "4760d432cd414539df029d1bf0776ebe9069f3c39193845badc52f36dcb27563"
  "86d73c5ab1b998ba5ac6e9d866139a6bc456bf8de8f66e01ecc7ce996143724e"
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
