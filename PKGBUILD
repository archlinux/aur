# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Arc-Dark-KDE
pkgname=('arc-dark-suite-git')
pkgver=r6.43c600c
pkgrel=1
pkgdesc="Arc-Dark cusomization for Plasma 5 (git version)"
arch=('any')
url="https://github.com/varlesh/${_pkgname}"
license=('CCPL:by-sa')
options=('!strip')
makedepends=('git')
depends=('plasma-desktop')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 ${pkgdir}/usr/share/{aurorae/themes,color-schemes,plasma/desktoptheme}
    cp -r ${srcdir}/${_pkgname}/aurorae/themes/Arc-Dark ${pkgdir}/usr/share/aurorae/themes/
    cp -r ${srcdir}/${_pkgname}/plasma-themes/Arc-Dark  ${pkgdir}/usr/share/plasma/desktoptheme/
    install -Dm644 -t "${pkgdir}/usr/share/color-schemes/"  ${srcdir}/${_pkgname}/color-schemes/*.colors
}
