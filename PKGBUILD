# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=vim-buftabline-git
pkgver=r52.228b1cb
pkgver() {
    cd "vim-buftabline"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Forget Vim tabs – now you can have buffer tabs"
arch=('any')
url="https://github.com/ap/vim-buftabline"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
install='vimdoc.install'
source=("git+https://github.com/ap/vim-buftabline.git")
md5sums=('SKIP')

package() {
    cd "vim-buftabline"
    _installpath="$pkgdir/usr/share/vim/vimfiles"
    install -Dm755 doc/buftabline.txt "$_installpath/doc/buftabline.txt"
    install -Dm755 plugin/buftabline.vim "$_installpath/plugin/buftabline.vim"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
