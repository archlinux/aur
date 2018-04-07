# Maintainer: Ankit R Gadiya <arch@argp.in>

pkgname=vim-tcomment-git
pkgver=3.08.1.r28.ge365bfa
pkgrel=1
pkgdesc="An extensible & universal comment vim-plugin that also handles embedded filetypes (Git Version)"
license=('GPL3')
arch=('any')
url="https://github.com/tomtom/tcomment_vim"
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("git+https://github.com/tomtom/tcomment_vim/")
md5sums=('SKIP')

pkgver() {
    cd tcomment_vim
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "tcomment_vim/plugin/tcomment.vim" \
        "${pkgdir}/usr/share/vim/vimfiles/plugin/tcomment.vim"
    install -Dm755 "tcomment_vim/doc/tcomment.txt" \
        "${pkgdir}/usr/share/vim/vimfiles/doc/tcomment.txt"
    install -Dm755 "tcomment_vim/autoload/tcomment.vim" \
        "${pkgdir}/usr/share/vim/vimfiles/autoload/tcomment.vim"
}
