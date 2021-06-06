# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-dark-kde-git
_pkgname=Aritim-Dark
pkgver=r108.a908770
pkgrel=2
pkgdesc="A Dark theme for KDE based DEs, deeply inspired by the Ayu Dark color palette."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
provides=('aritim-dark-kde')
optdepends=('aritim-dark-gtk: Matching GTK theme' 'lightly-qt: Matching Application style')
license=('GPL3')
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')
makedepends=('git')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

shopt -s extglob

package() {
    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/aurorae/themes/Aritim-Dark"
    mkdir -p "${pkgdir}/usr/share/color-schemes"
    mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Dark"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"

    cp -r KDE/auroraeTheme/* ${pkgdir}/usr/share/aurorae/themes/Aritim-Dark
    cp -r KDE/colorScheme/AritimDark.colors ${pkgdir}/usr/share/color-schemes
    cp -r KDE/globalTheme/* ${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Dark
    cp -r KDE/plasmaTheme/Aritim-Dark* ${pkgdir}/usr/share/plasma/desktoptheme
}

