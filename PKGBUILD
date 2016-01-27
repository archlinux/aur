# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=k3b-l10n-bin
pkgname="${_pkgname}-git"
pkgver=20160127
pkgrel=1
pkgdesc="Language packs for K3B GIT AUR releases"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL')
makedepends=('git')
optdepends=('k3b-git: K3B GIT version' 
            'k3b-frameworks-git: K3B KF5 Frameworks branch GIT version')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    install -dm755 ${pkgdir}/usr/share/locale/kde4/
    rm ${srcdir}/${_pkgname}/{README.md,COPYING.GPL2}
    cp -rf ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/locale/
    cp -rf ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/locale/kde4/
}
