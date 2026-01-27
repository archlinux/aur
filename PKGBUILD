# Maintainer: kobe-koto <admin at koto dot cc>
pkgname="sharp-craft-launcher-bin"
_pkgname="SharpCraftLauncher"
pkgver=1.2.0
_pkgdate=20240216
pkgrel=2
pkgdesc="A super light, fast, clean minecraft launcher framework written in rust."
arch=('x86_64' 'aarch64')
url="https://github.com/Steve-xmh/scl"
license=('LGPL-3.0-only')
depends=(
  'gtk3' 'openssl-1.1'
)
optdepends=('hicolor-icon-theme')
conflicts=("sharp-craft-launcher")
provides=("sharp-craft-launcher")

source=("SCL-icon.png" "SCL.desktop")
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${_pkgdate}-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${pkgrel}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${_pkgdate}-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('ac418e2a871efc0eb4393a15da1352771524fb94b998a8614e158a8ab581f6be'
            'b9201fd7dda93168660eb835363cb8262ecb177c0d2de1b2ba997b838488cdec')
sha256sums_x86_64=('c779cc16d6cf89c70602fdea4b7d7f9985f34827e91ceaeb927dfd243dd556ae')
sha256sums_aarch64=('8408f4c1e8c09b0adbe62e9675b5138ad848827a989a57cca8130983efb77085')

package() {
  install -Dm755 "${srcdir}"/${_pkgname}-${_pkgdate}-${pkgver}-* "${pkgdir}/opt/${pkgname}/${_pkgname}"
  install -Dm644 $(readlink "${srcdir}/SCL-icon.png") "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 $(readlink "${srcdir}/SCL.desktop")  "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
