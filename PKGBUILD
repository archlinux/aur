# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-light-kde-git
_pkgname=Aritim-Light
pkgver=r68.19223ea
pkgrel=2
pkgdesc="A Light theme for KDE, pleasant to the eyes and perfect for your daily workload."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
provides=('aritim-light-kde')
optdepends=('aritim-light-gtk-git: Matching GTK theme')
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

    mkdir -p "${pkgdir}/usr/share/aurorae/themes/Aritim-Light"
    mkdir -p "${pkgdir}/usr/share/color-schemes"
    mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Light"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"

    cp -r KDE/auroraeTheme/* ${pkgdir}/usr/share/aurorae/themes/Aritim-Light
    cp -r KDE/colorScheme/AritimLight.colors ${pkgdir}/usr/share/color-schemes
    cp -r KDE/globalTheme/* ${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Light
    cp -r KDE/plasmaTheme/Aritim-Light* ${pkgdir}/usr/share/plasma/desktoptheme
}

 
