_gitname=suru-plus
pkgname=suru-plus-git
pkgver=r2.84b10a5
pkgrel=1
pkgdesc="A third-party Suru icons for Ubuntu 18.04
An elegant, modern and sweet Suru icons based on Suru Icons by Sam Hewitt"
arch=('any')
url="https://github.com/gusbemacbe/${_gitname}"
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
    rm -rf "$pkgdir/usr/share/icons/suru-plus/.gitignore"
    rm -rf "$pkgdir/usr/share/icons/suru-plus/.git"
    rm -rf "$pkgdir/usr/share/icons/suru-plus/.github"
    rm -rf "$pkgdir/usr/share/icons/suru-plus/.product"
    rm -rf "$pkgdir/usr/share/icons/suru-plus/configure"
}
