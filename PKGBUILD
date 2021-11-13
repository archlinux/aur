# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=vim-indentline-git
pkgver=r166.86b9824
pkgver() {
    cd "indentLine"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A vim plugin to display the indention levels with thin vertical lines"
arch=('any')
url="https://github.com/Yggdroot/indentLine"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
install='vimdoc.install'
source=("git+https://github.com/Yggdroot/indentLine.git")
md5sums=('SKIP')

package() {
    cd "indentLine"
    _installpath="$pkgdir/usr/share/vim/vimfiles"
    install -Dm755 doc/indentLine.txt "$_installpath/doc/indentLine.txt"
    install -Dm755 after/plugin/indentLine.vim "$_installpath/plugin/indentLine.vim"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

