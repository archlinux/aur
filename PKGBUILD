# Maintainer: nukeop

pkgname=nuclear-player-bin
_pkgname=nuclear-player
pkgver=1.26.0
pkgrel=1
pkgdesc='Nuclear is a free, open-source music player without ads or tracking.'
arch=(x86_64)
url='https://nuclearplayer.com'
license=('AGPL-3.0-only')
provides=('nuclear-player')
conflicts=('nuclear-player' 'nuclear-player-git')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'gst-plugins-base' 'gst-plugins-good')
optdepends=(
    'gst-plugins-bad: Additional media codec support'
    'gst-plugins-ugly: Patented codec support'
    'gst-libav: FFmpeg-based codec support'
)
source=(
    "nuclear-player-1.26.0.deb::https://github.com/nukeop/nuclear/releases/download/player@1.26.0/Nuclear_1.26.0_amd64.deb"
    "https://raw.githubusercontent.com/nukeop/nuclear/player@1.26.0/LICENSE"
)
noextract=("nuclear-player-1.26.0.deb")
sha256sums=('ced7c52dc2635b277578a8c47fb6ca742ed0d4d61df02b8aacee02c55c8ac93f'
            'SKIP')

package() {
    bsdtar -O -xf "${srcdir}/nuclear-player-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
