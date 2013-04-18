# Maintainer: Joris Steyn <jorissteyn@gmail.com>
pkgname=vim-gitgutter-git
pkgver=103.935184b
pkgrel=1
pkgdesc="A Vim plugin which shows a git diff in the 'gutter'"
arch=('any')
url="https://github.com/airblade/vim-gitgutter.git"
license=('MIT')
depends=('vim')
makedepends=('git')
source=('git://github.com/airblade/vim-gitgutter.git#branch=master')
md5sums=('SKIP')
install=vimdoc.install

pkgver() {
    cd "$SRCDEST"/vim-gitgutter
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    install -Dm644 ${srcdir}/vim-gitgutter/plugin/gitgutter.vim ${pkgdir}/usr/share/vim/vimfiles/plugin/gitgutter.vim
    install -Dm644 ${srcdir}/vim-gitgutter/doc/gitgutter.txt ${pkgdir}/usr/share/vim/vimfiles/doc/gitgutter.txt
}

