# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=krusader-l10n-bin
pkgname="${_pkgname}-git"
pkgver=20160127
pkgrel=1
pkgdesc="Language packs for Krusader KF5 GIT AUR release"
arch=('any')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL')
depends=('krusader-git')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    install -dm755 ${pkgdir}/usr/share/locale/
    rm ${srcdir}/${_pkgname}/{README.md,COPYING.GPL2}
    cp -rf ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/locale/
} 
