_gitname=SURU-PLUS
pkgname=suru-plus-git
pkgver=r2.84b10a3
pkgrel=1
pkgdesc="An icon pack designed to integrate with most desktop environments"
arch=('any')
url="https://github.com/Magog64/${_gitname}"
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
    rm -rf "$pkgdir/usr/share/icons/SURU-PLUS/.gitignore"
    rm -rf "$pkgdir/usr/share/icons/SURU-PLUS/.git"
    rm -rf "$pkgdir/usr/share/icons/SURU-PLUS/.github"
    rm -rf "$pkgdir/usr/share/icons/SURU-PLUS/.product"
    rm -rf "$pkgdir/usr/share/icons/SURU-PLUS/configure"
}
