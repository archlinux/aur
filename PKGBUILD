 # Maintainer: gigas002 <gigas002@pm.me>

_pkgname=sweet-folders
pkgname=sweet-folders-git
pkgver=r14.b2192ff
pkgrel=1
pkgdesc="Sweet folders icons"
arch=('any')
url="https://github.com/EliverLara/Sweet-folders"
license=('GPL3')
makedepends=('git')
options=('!strip')
provides=("sweet-folders")
conflicts=("sweet-folders")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname^}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cd ${srcdir}/${_pkgname^}
    cp -r * ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
