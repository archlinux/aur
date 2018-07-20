# Contributor: Daniel Miranda <dmiranda at gmail dot com>
# Maintainer: Gustavo Costa <gusbemacbe@gmail.com>

_gitname=suru-plus-aspromauros
pkgname=suru-plus-aspromauros-git
pkgver=r1.0
pkgrel=1
pkgdesc="A Suru++ monochromatic icons theme for users of dark environments"
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
    rm -rf "$pkgdir"/usr/share/icons/suru-plus-aspromauros/{configure, .git, .github, .gitattributes, .gitignore, *.md, *.jpg, *.svg, *.png, .product}
}
