# Maintainer: nukeop

pkgname=nuclear-player-bin
_pkgname=nuclear-player
pkgver=1.38.0
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
    "nuclear-player-1.38.0.deb::https://github.com/nukeop/nuclear/releases/download/player@1.38.0/Nuclear_1.38.0_amd64.deb"
    "https://raw.githubusercontent.com/nukeop/nuclear/player@1.38.0/LICENSE"
)
noextract=("nuclear-player-1.38.0.deb")
sha256sums=('6e36e09c63f7277693e1d54d08b5ae4c6e28bedbe7b63b7172b9a0aa574f6c7f'
            'SKIP')

package() {
    bsdtar -O -xf "${srcdir}/nuclear-player-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
