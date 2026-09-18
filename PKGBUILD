# Maintainer: Youknow-sys <samani0019 at gmail dot com>

pkgname=dorion-bin
pkgver=6.13.1
_rpmrel=1
pkgrel=1
pkgdesc="Tiny alternative Discord client with a smaller footprint, snappier startup, themes, plugins and more!"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://spikehd.dev/projects/dorion"
_url="https://github.com/SpikeHD/Dorion"
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

source_x86_64=("${pkgname}-${pkgver}-x86_64.rpm::${_url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.x86_64.rpm")
source_aarch64=("${pkgname}-${pkgver}-aarch64.rpm::${_url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.aarch64.rpm")
source_armv7h=("${pkgname}-${pkgver}-armv7h.rpm::${_url}/releases/download/v${pkgver}/Dorion_${pkgver}-${_rpmrel}.armhfp.rpm")

sha256sums_x86_64=('129e8948001f6d0ec0314fd351466396dfac3b67bc51b45d469dfcdeb2df1816')
sha256sums_aarch64=('b9863473bb75d581c941668cc47be8d8e20327032dc6e84bd011fd4d3d28de14')
sha256sums_armv7h=('f397132b6351a2ff8e7dd96cadebd6386cbceb0b7308bb73345fbeb7ab0287be')

package() {
    cp -dr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}/"
    ln -s Dorion "${pkgdir}/usr/bin/dorion"
}
