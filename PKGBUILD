# Maintainer: nukeop

pkgname=nuclear-player-bin
_pkgname=nuclear-player
pkgver=1.25.1
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
    "nuclear-player-1.25.1.deb::https://github.com/nukeop/nuclear/releases/download/player@1.25.1/Nuclear_1.25.1_amd64.deb"
    "https://raw.githubusercontent.com/nukeop/nuclear/player@1.25.1/LICENSE"
)
noextract=("nuclear-player-1.25.1.deb")
sha256sums=('c661f1ed65a8d1ffb86cc80653de82f9c9390d00f5f337f4ca87a092c1def8fa'
            'SKIP')

package() {
    bsdtar -O -xf "${srcdir}/nuclear-player-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
