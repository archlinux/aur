# Maintainer: Darvin Delgado <dnmodder@gmail.com>

_gitname=candy-icons
_autor=EliverLara
pkgname=candy-icons-git
pkgver=r91.a3e3067
pkgrel=1
pkgdesc="Sweet gradient icons."
arch=('any')
url="https://github.com/${_autor}/${_gitname}"
license=('unknown')
makedepends=('git')
options=('!strip')
provides=("candy-icons")
conflicts=("candy-icons")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -d ${pkgdir}/usr/share/icons
    cp -r ${_gitname} ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
