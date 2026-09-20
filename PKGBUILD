# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=6.13.2
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

sha256sums_x86_64=('8cbace7e4bc6a333f063fd95ea6fb7b43bdbd8d1550422ffc0eb8f946d3d0fd2')
sha256sums_aarch64=('e1b8f36399f35b843ad185059bc4d2a500c6496f6a25a0b39552ca8322deec18')
sha256sums_armv7h=('0e1c206f934817a190c7cb6c48ba5c505673d80dd9324851a171bad93805c2be')

package() {
    cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    ln -s Dorion "${pkgdir}/usr/bin/dorion"
}
