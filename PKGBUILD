# Maintainer: Ciarán Coffey <github@ccoffey.ie>
pkgname='pbpctrl-plasmoid'
pkgver=0.1.0
pkgrel=1
pkgdesc='KDE Plasma 6 system tray plasmoid for controlling Google Pixel Buds Pro via pbpctrl'
url='https://github.com/ciarancoffey/pbpctrl-plasmoid'
license=('MIT')
arch=('any')
depends=('plasma-workspace' 'plasma5support' 'pbpctrl' 'libpulse')
optdepends=(
    'libfdk-aac: AAC codec support'
    'liblc3: LC3/LC3-SWB codec support (best headset mode quality)'
    'libfreeaptx: aptX/aptX HD codec support'
    'libldac: LDAC codec support'
    'opus: Opus codec support (best playback quality)'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ciarancoffey/pbpctrl-plasmoid/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/share/plasma/plasmoids/com.github.ciarancoffey.pbpctrl-plasmoid"
    cp -r plasmoid/* "${pkgdir}/usr/share/plasma/plasmoids/com.github.ciarancoffey.pbpctrl-plasmoid/"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
