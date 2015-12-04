# Maintainer: FireZ <firez199984@gmail.com>

pkgname=vim-arduino-syntax-git
_pkgname=vim-arduino-syntax
pkgver=r17.83f766d
pkgrel=1
url=https://github.com/sudar/vim-arduino-syntax
pkgdesc="Arduino syntax files for Vim"
arch=(any)
depends=(vim)
source=("git://github.com/sudar/vim-arduino-syntax.git")
md5sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    for dir in ftdetect indent syntax
    do
        install -d -m 755 ${pkgdir}/usr/share/vim/vimfiles/${dir}
        install -D -m 644 ${dir}/* ${pkgdir}/usr/share/vim/vimfiles/${dir}
    done
}
