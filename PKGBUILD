# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Arc-Dark-KDE
pkgname=('arc-dark-suite-git')
pkgver=r8.71923af
pkgrel=1
pkgdesc="Arc-Dark cusomization for Plasma 5 (git version)"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git')
depends=('plasma-desktop')
optdepends=("gtk-theme-arc-git: A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell (git version)"
            "papirus-icon-theme-kde-git: Papirus icon theme for KDE (git version)")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 ${pkgdir}/usr/share/{aurorae/themes,color-schemes,plasma/desktoptheme}
    cp -r ${srcdir}/${_pkgname}/aurorae/themes/${_pkgname/-KDE//}       ${pkgdir}/usr/share/aurorae/themes/
    cp -r ${srcdir}/${_pkgname}/plasma/desktoptheme/${_pkgname/-KDE//}  ${pkgdir}/usr/share/plasma/desktoptheme/
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"              ${srcdir}/${_pkgname}/color-schemes/*.colors
}


