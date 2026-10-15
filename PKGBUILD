# Maintainer: physkets <physkets // at // tutanota dot com>

_pkgname=vala.vim
pkgname=vim-vala-arrufat-git
pkgver=r85.3c5988d
pkgrel=2
pkgdesc='Vim runtime files for Vala.'
arch=('x86_64')
url='https://github.com/vala-lang/vala.vim'
license=('GPL-3.0-or-later')
makedepends=(git)
provides=('vim-vala')
conflicts=('vim-vala')
source=("git+https://github.com/vala-lang/vala.vim.git")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 "ftdetect/vala.vim" -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect"
    install -Dm 644 "indent/vala.vim" -t "${pkgdir}/usr/share/vim/vimfiles/indent"
    install -Dm 644 "syntax/vala.vim" -t "${pkgdir}/usr/share/vim/vimfiles/syntax"
}
