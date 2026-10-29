# Maintainer: temidaradev <temidaradev@proton.me>
pkgname=kopuz-nightly-bin
# pkgver cannot hold the tag's "-", so the release's own version rides in _version.
_version=0.68.0-nightly.20261029.3
pkgver=0.68.0_nightly.20261029.3
pkgrel=1
pkgdesc="A modern music player, built nightly from the latest development code (pre-built binary)"
arch=('x86_64')
url="https://github.com/Kopuz-org/kopuz"
license=('EUPL-1.2')
provides=('kopuz-nightly' 'kopuzd-nightly' 'kopuzctl-nightly')
conflicts=('kopuz-nightly')
depends=(
    'ca-certificates'
    'alsa-lib'
    'openssl'
    'gcc-libs'
    'libxcb'
    'libxkbcommon'
    'libxkbcommon-x11'
    'wayland'
    'vulkan-icd-loader'
    'fontconfig'
    'freetype2'
)
optdepends=(
    'ffmpeg: converting YouTube downloads to MP3, FLAC or WAV'
)
source=("kopuz-nightly-$pkgver-$pkgrel.deb::https://github.com/Kopuz-org/kopuz/releases/download/v$_version/kopuz-nightly_${_version}_amd64.deb")
# Filled in at publish time from the release's kopuz-nightly_<version>_amd64.deb.sha256.
sha256sums=('444b3abde913650928aba50f7d180995df6ae85b22662a64242bc7cbbc6c0907')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
