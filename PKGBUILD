# Contributor: Daniel Miranda (dmiranda)

_gitname=suru-plus
pkgname=suru-plus-git
pkgver=r2.9
pkgrel=1
pkgdesc="An elegant, modern and sweet third-party Suru icons, based on Sam Hewitt's Suru Icons"
arch=('any')
url="https://github.com/gusbemacbe/${_gitname}"
license=('GPL3')
makedepends=('git')
options=('!strip')
conflicts=(${_gitname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() 
{
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() 
{
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}* ${pkgdir}/usr/share/icons/
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr -type f -name '.directory' -delete
    rm -rf "$pkgdir"/usr/share/icons/suru-plus/{configure, .git, .github, .gitattributes, .gitignore,*.md,*.jpg,*.svg,*.png, .product, 'nuove icone', 'Suru++ OpenDesktop'}
}
