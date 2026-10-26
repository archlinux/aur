# Maintainer: nukeop

pkgname=nuclear-player-bin
_pkgname=nuclear-player
pkgver=1.52.2
pkgrel=1
pkgdesc='Nuclear is a free, open-source music player without ads or tracking.'
arch=(x86_64)
url='https://nuclearplayer.com'
license=('AGPL-3.0-only')
provides=('nuclear-player')
conflicts=('nuclear-player' 'nuclear-player-git')
options=('!strip' '!debug')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav')
optdepends=(
    'gst-plugins-bad: Additional media codec support'
    'gst-plugins-ugly: Patented codec support'
)
source=(
    "nuclear-player-1.52.2.deb::https://github.com/nukeop/nuclear/releases/download/player@1.52.2/Nuclear_1.52.2_amd64.deb"
    "https://raw.githubusercontent.com/nukeop/nuclear/player@1.52.2/LICENSE"
)
noextract=("nuclear-player-1.52.2.deb")
sha256sums=('6959ce4aacc47b6afc44fd70acab81ac836d6c85050c100421845ceb1e8c79c6'
            'SKIP')

package() {
    bsdtar -O -xf "${srcdir}/nuclear-player-${pkgver}.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
