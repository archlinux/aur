# Maintainer: James Farr Gomez <james@nertwork.com>
pkgname=bluepill-bin
pkgver=1.2.16
pkgrel=1
pkgdesc="BluePill — Native Linux/Wayland Qt6/QML desktop & CLI client for iMessage, RCS, and SMS (prebuilt binary)"
arch=('x86_64')
url="https://github.com/nertwork/bluepill"
license=('MIT')
provides=('bluepill' 'imsg')
conflicts=('bluepill' 'imsg')
replaces=('imsg')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-multimedia' 'qt6-wayland' 'libnotify')
optdepends=(
    'qt6-multimedia-ffmpeg: Native in-process FFmpeg audio playback backend'
    'libheif: Fast HEIC/HEIF photo attachment decoding'
    'imagemagick: Fallback HEIC/AVIF image conversion'
    'libsecret: Secret Service keyring lookup via secret-tool'
    'pipewire-pulse: Notification sound playback (paplay)'
)
options=('!strip' '!debug')
source=("bluepill-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/nertwork/bluepill/releases/download/v${pkgver}/bluepill-${pkgver}-1-x86_64.pkg.tar.zst")
noextract=("bluepill-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('52249ccefe5e88246a7bee88442d3a4c37ba96a457fb0bdb157c9e6400708bb9')

package() {
    tar --zstd -xf "$srcdir/bluepill-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir" usr
}
