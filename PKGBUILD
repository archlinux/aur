# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Arc-Dark-KDE
pkgname=('arc-dark-suite-git')
pkgver=r19.83bb5be
pkgrel=1
pkgdesc="Arc-Dark cusomization for Plasma 5 (git version)"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git')
depends=('plasma-desktop' 'yakuake')
optdepends=("gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
            "papirus-icon-theme-kde-git: Papirus icon theme for KDE (git version)")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 ${pkgdir}/usr/share/{aurorae/themes,color-schemes,plasma/desktoptheme,yakuake/skins}
    cp -r ${srcdir}/${_pkgname}/aurorae/themes/${_pkgname/-KDE//}       ${pkgdir}/usr/share/aurorae/themes/
    cp -r ${srcdir}/${_pkgname}/plasma/desktoptheme/${_pkgname/-KDE//}  ${pkgdir}/usr/share/plasma/desktoptheme/
    cp -r ${srcdir}/${_pkgname}/yakuake/kns_skins/arc-dark              ${pkgdir}/usr/share/yakuake/skins/
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"              ${srcdir}/${_pkgname}/color-schemes/*.colors
}


