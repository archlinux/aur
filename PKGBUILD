# Maintainer: Mélanie Chauvel (ariasuni) <aria at ariasuni dot eu>

pkgname=(breeze-flat)
provides=(breeze-light-flat breeze-dark-flat)
conflicts=(breeze-light-flat breeze-dark-flat)
pkgver=1.2
pkgrel=2
pkgdesc="Breeze Light and Dark, but opaque and not shadowed"
arch=('any')
url='https://store.kde.org/p/1215691/'
license=('LGPL3')
source=("https://framagit.org/ariasuni/breeze-flat/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('0381be8571c1aeb2644b532fe91889296e91aef399015a20d0969c7673633cb1')

build() {
    cd ${srcdir}/${pkgname}-v${pkgver}
    sh scripts/symlink.sh
}

package() {
    install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r ${srcdir}/${pkgname}-v${pkgver}/* ${pkgdir}/usr/share/plasma/desktoptheme
}
