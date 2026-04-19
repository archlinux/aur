# Maintainer: gigas002 <gigas002@pm.me>

_pkgname=sweet-folders
pkgname=sweet-folders-git
pkgver=r29.40a5d36
pkgrel=1
pkgdesc="Sweet folders icons"
arch=('any')
url="https://github.com/EliverLara/Sweet-folders"
license=('GPL-3.0-only')
makedepends=('git')
options=('!strip')
provides=("sweet-folders")
conflicts=("sweet-folders")
source=("${_pkgname^}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd ${_pkgname^}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 ${pkgdir}/usr/share/icons
    cd ${srcdir}/${_pkgname^}
    cp -r [^.]* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} +
    find ${pkgdir}/usr -type d -exec chmod 755 {} +
}
