# Maintainer: Amal Karunarathna <nasashinega@gmail.com>
# Contributor: barcia <barcia@opmbx.org>

_gitname=la-capitaine-icon-theme
pkgname=la-capitaine-icon-theme-git
pkgver=r400.81a15fbe
pkgrel=3
pkgdesc="An icon pack designed to integrate with most desktop environments"
arch=('any')
url="https://github.com/keeferrourke/${_gitname}"
license=('GPL3')
makedepends=('git')
options=('!strip')
conflicts=(${_gitname})
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
    rm -rf "$pkgdir/usr/share/icons/la-capitaine-icon-theme/.gitignore"
    rm -rf "$pkgdir/usr/share/icons/la-capitaine-icon-theme/.git"
    rm -rf "$pkgdir/usr/share/icons/la-capitaine-icon-theme/.github"
    rm -rf "$pkgdir/usr/share/icons/la-capitaine-icon-theme/.product"
    rm -rf "$pkgdir/usr/share/icons/la-capitaine-icon-theme/configure"
}
