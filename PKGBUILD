# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=7.0.1
_rpmrel=1
pkgrel=1
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64') # no aarch64: extra/cef is x86_64-only
url="https://github.com/SpikeHD/Dorion"
license=('GPL-3.0-only')
depends=(
    'cef'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libxcb'
    'openssl'
    'xdg-utils'
)
optdepends=(
    'xdg-desktop-portal: system accent color and idle detection'
)
provides=('dorion')
conflicts=('dorion')
options=('!debug' '!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.x86_64.rpm")
# aarch64 needs cef, which is x86_64-only in the repos
#source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.aarch64.rpm")

sha256sums_x86_64=('fceddec2f93cbf094ff6df98ec830696a9d8af8dc42d3369919b70ac1e627bc5')
#sha256sums_aarch64=('dcf05b1c713f642619a071c941594c7275a7564a2b4f4fef50be608b07006120')

package() {
    cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    ln -s Dorion "${pkgdir}/usr/bin/dorion"
}
