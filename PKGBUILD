# Maintainer: Bradley Ridnour <bradley@ridnour.net>
pkgname=aritim-light-kde
_pkgname=Aritim-Light
pkgver=r41.89a25fe
pkgrel=1
pkgdesc="A Light theme for KDE, pleasant to the eyes and perfect for your daily workload."
arch=(any)
url="https://github.com/Mrcuve0/$_pkgname"
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

package_aritim-light-kde() {
    provides=('aritim-light-kde')
    optdepends=('aritim-light-gtk: Matching GTK theme')

    cd $_pkgname

    mkdir -p "${pkgdir}/usr/share/aurorae/themes/Aritim-Light"
    mkdir -p "${pkgdir}/usr/share/color-schemes"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"
    mkdir -p "${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Light"
    mkdir -p "${pkgdir}/usr/share/plasma/desktoptheme"

    cp -r KDE/auroraeTheme/* ${pkgdir}/usr/share/aurorae/themes/Aritim-Light
    cp -r KDE/colorScheme/AritimLight.colors ${pkgdir}/usr/share/color-schemes
    cp -r KDE/lookAndFeel/* ${pkgdir}/usr/share/plasma/look-and-feel/Aritim-Light
    cp -r KDE/plasmaTheme/* ${pkgdir}/usr/share/plasma/desktoptheme
}

