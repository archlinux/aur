# Maintainer: Aaron Honeycutt <aaronhoneycutt at proton dot me>
pkgname=vivaldi-stable-arm64
pkgver=6.0.2979.18
pkgrel=1
pkgdesc="Vivaldi ARM64 Linux"
arch=('aarch64')
url="https://vivaldi.com/downloads"
license=('custom')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('imagemagick' 'w3m')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'libnotify: native notifications'
)
source=("https://downloads.vivaldi.com/stable/vivaldi-stable_6.0.2979.18-1_arm64.deb")
noextract=("${pkgname}_${pkgver}-${pkgrel}_arm64.deb")
sha256sums=('4b76f49a65ac42158328fcf7e06cdbe74abec00511005344b7a22f0aaa3c08cb')

package() {
    bsdtar -O -xf "vivaldi-stable_${pkgver}-${pkgrel}"_arm64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
}
