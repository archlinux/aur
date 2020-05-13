# Maintainer: Mélanie Chauvel (ariasuni) <perso at hack-libre dot org>

pkgbase=breeze-flat
pkgname=(breeze-light-flat breeze-dark-flat)
pkgver=1.2
pkgrel=1
_pkgdesc="but opaque and not shadowed"
pkgdesc="Breeze Light and Dark, ${_pkgdesc}"
arch=('any')
url='https://store.kde.org/p/1215691/'
license=('LGPL3')
depends=('plasma-framework')
source=("https://framagit.org/ariasuni/breeze-flat/-/archive/v${pkgver}/${pkgbase}-v${pkgver}.tar.gz")
sha256sums=('0381be8571c1aeb2644b532fe91889296e91aef399015a20d0969c7673633cb1')

build() {
    cd ${srcdir}/${pkgbase}-v${pkgver}
    sh scripts/symlink.sh
}

package_breeze-light-flat() {
    pkgdesc="Breeze Light, ${_pkgdesc}"
    copy_theme
}

package_breeze-dark-flat() {
    pkgdesc="Breeze Dark, ${_pkgdesc}"
    copy_theme
}

copy_theme() {
    install -dm755 "${pkgdir}/usr/share/plasma/desktoptheme"
    cp -r ${srcdir}/${pkgbase}-v${pkgver}/${pkgname} ${pkgdir}/usr/share/plasma/desktoptheme
}
