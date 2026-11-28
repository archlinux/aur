# Maintainer: temidaradev <temidaradev@proton.me>
pkgname=kopuz-nightly-bin
# pkgver cannot hold the tag's "-", so the release's own version rides in _version.
_version=1.0.1-nightly.20261128
pkgver=1.0.1_nightly.20261128
pkgrel=1
pkgdesc="A modern music player, built nightly from the latest development code (pre-built binary)"
arch=('x86_64')
url="https://kopuz.moe"
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
sha256sums=('848aafed2d31904b41e01c29c781d9decd0b5a1aa9c2febb8795ffe0db8918ee')

package() {
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
