# Maintainer: barcia <barcia@opmbx.org>

_gitname=la-capitaine-icon-theme
_pkgname=La-Capitaine
pkgname=('la-capitaine-icon-theme-git')
pkgver=r35.5a3c661
pkgrel=1
pkgdesc="An icon pack designed to integrate with most desktop environments"
arch=('any')
url="https://github.com/keeferrourke/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
}
