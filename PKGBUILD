# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-icons
pkgname="${_pkgname}-git"
pkgver=r843.fe98ec6
pkgrel=1
pkgdesc="Breeze icon themes for KDE Plasma. (GIT version)"
arch=('any')
url="https://github.com/NitruxSA/breeze-icon-theme"
license=('LGPL')
groups=('kf5')
makedepends=('git')
provides="${_pkgname}"
conflicts="${_pkgname}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d -m 755 ${pkgdir}/usr/share/icons/{breeze,breeze-dark}
    cp -r ${srcdir}/${_pkgname}/Breeze/*        ${pkgdir}/usr/share/icons/breeze/
    cp -r ${srcdir}/${_pkgname}/Breeze\ Dark/*  ${pkgdir}/usr/share/icons/breeze-dark/
}
