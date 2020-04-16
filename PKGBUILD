# Maintainer: physkets <physkets // at // tutanota dot com>

_pkgname=vim-glsl
pkgname=${_pkgname}-git
pkgver='r45.fbdb226'
pkgrel=2
pkgdesc='Vim runtime files for OpenGL Shading Language.'
arch=('x86_64')
url='https://github.com/tikhomirov/vim-glsl'
license=('MIT')
conflicts=('vim-glsl')
source=("git+https://github.com/tikhomirov/vim-glsl.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 "ftdetect/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
    install -Dm 644 "indent/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/indent"
    install -Dm 644 "syntax/glsl.vim" -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
    install -Dm 644 "after/syntax/html.vim" -t "${pkgdir}/usr/share/vim/vimfiles/after/syntax"
}
