# Maintainer: wenLiangcan <boxeed at gmail dot com>
# Contributor: se7enday(87635645#qq.com)

pkgname=grub2-theme-vimix-legacy-git
_pkgname=grub2-theme-vimix-git
pkgver=20181108
pkgrel=1
pkgdesc="Grub2 theme Vimix (legacy version)"
url="https://github.com/Se7endAY/grub2-theme-vimix"
arch=('any')
license=('GPLv3')
depends=('grub')
makedepends=('git')
install=${_pkgname}.install
source=("${_pkgname}"::"git+https://github.com/Se7endAY/grub2-theme-vimix#branch=legacy")
conflicts=('grub2-theme-vimix' 'grub2-theme-vimix-git')
replaces=('grub2-theme-vimix-git' 'grub2-theme-vimix')
provides=('grub2-theme-vimix-git' 'grub2-theme-vimix')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
    cd "$srcdir/${_pkgname}"
    find ./Vimix/ -type f -exec install -Dm644 {} \
        "${pkgdir}/boot/grub/themes/{}" \;
}

