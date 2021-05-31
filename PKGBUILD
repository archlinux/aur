# Maintainer: Darvin Delgado <dnmodder@gmail.com>

_pkgname=candy-icons
pkgname=candy-icons-git
pkgver=r595.7a29005
pkgrel=1
pkgdesc="Sweet gradient icons"
arch=('any')
url="https://github.com/EliverLara/candy-icons"
license=('GPL3')
makedepends=('git')
options=('!strip')
provides=("candy-icons")
conflicts=("candy-icons")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${_pkgname} ${pkgdir}/usr/share/icons/
    rm -rf "${pkgdir}/usr/share/icons/candy-icons/.git"
    rm -rf "${pkgdir}/usr/share/icons/candy-icons/.github"
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
