# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=vim-multiple-cursors-git
pkgver=r194.51d0717
pkgver() {
    cd "vim-multiple-cursors"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="True Sublime Text style multiple selections for Vim"
arch=('any')
url="https://github.com/terryma/vim-multiple-cursors"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
install='vimdoc.install'
source=("git+https://github.com/terryma/vim-multiple-cursors.git")
md5sums=('SKIP')

package() {
    cd "vim-multiple-cursors"
    _installpath="$pkgdir/usr/share/vim/vimfiles"
    install -Dm755 doc/multiple_cursors.txt "$_installpath/doc/multiple_cursors.txt"
    install -Dm755 plugin/multiple_cursors.vim "$_installpath/plugin/multiple_cursors.vim"
    install -Dm755 autoload/multiple_cursors.vim "$_installpath/autoload/multiple_cursors.vim"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
