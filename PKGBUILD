# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=k3b-l10n-bin
pkgname="${_pkgname}-git"
pkgver=r2.d922771
pkgrel=1
pkgdesc="Language packs for K3B GIT AUR releases"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL')
optdepends=('k3b-git: K3B GIT version' 
            'k3b-frameworks-git: K3B KF5 Frameworks branch GIT version')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/${_pkgname}
    install -dm755 ${pkgdir}/usr/share/locale/kde4/
    cp -rf * ${pkgdir}/usr/share/locale/
    cp -rf * ${pkgdir}/usr/share/locale/kde4/
}
