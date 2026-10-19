# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=6.14.0
_rpmrel=1
pkgrel=1
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/SpikeHD/Dorion"
license=('GPL-3.0-only')
depends=(
    'dbus'
    'gst-plugins-base'
    'gst-plugins-good'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'openssl'
    'webkit2gtk-4.1'
    'xdg-utils'
    'zstd'
)
optdepends=(
    'gst-plugins-bad: H.264 decoding for screenshares'
    'xdg-desktop-portal: system accent color and idle detection'
)
provides=('dorion')
conflicts=('dorion')
options=('!debug' '!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.x86_64.rpm")
source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.aarch64.rpm")
source_armv7h=("${pkgname}-${pkgver}-armv7h.rpm::${url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.armhfp.rpm")

sha256sums_x86_64=('4e980fe5efcca145d5651bfe405bce23deea2dc74ae64554b993d19989bde8c4')
sha256sums_aarch64=('d37e7a615899c311a3f73338c7b0ffb5c6a251b632159ad9dc10d738662e7d1b')
sha256sums_armv7h=('5142510d6ca2717183845f7058c027a2401aafb24764fc299af6af675b9e77fe')

package() {
    cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    ln -s Dorion "${pkgdir}/usr/bin/dorion"
}
