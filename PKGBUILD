# Maintainer: Matthew Gamble
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=vim-json-git
epoch=1
pkgver=r94.f5e3181
pkgrel=1
pkgdesc='Syntax highlighting for JSON, including JSON-specific (non-JS) warnings and quote concealing.'
arch=('any')
url='https://github.com/elzr/vim-json'
license=('MIT')
depends=('vim')
provides=('vim-json')
conflicts=('vim-json')
source=('git://github.com/elzr/vim-json.git')
sha256sums=('SKIP')

pkgver() {
    cd "vim-json"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "vim-json"
    install -D -m644 ftdetect/json.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/json.vim"
    install -D -m644 ftplugin/json.vim "$pkgdir/usr/share/vim/vimfiles/ftplugin/json.vim"
    install -D -m644 indent/json.vim "$pkgdir/usr/share/vim/vimfiles/indent/json.vim"
    install -D -m644 syntax/json.vim "$pkgdir/usr/share/vim/vimfiles/syntax/json.vim"
}
