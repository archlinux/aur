# Maintainer: Matthew Gamble
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=vim-json-git
_pkgname=vim-json
pkgver=2015.05.12
pkgrel=1
pkgdesc='Syntax highlighting for JSON, including JSON-specific (non-JS) warnings and quote concealing.'
arch=('any')
url='https://github.com/elzr/vim-json'
license=('MIT')
depends=('vim')
source=('git://github.com/elzr/vim-json.git')
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git log -1 --format=format:%cd --date=short | sed 's|-|.|g'
}

package() {
    cd "$_pkgname"
	install -D -m644 ftdetect/json.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/json.vim"
	install -D -m644 ftplugin/json.vim "$pkgdir/usr/share/vim/vimfiles/ftplugin/json.vim"
    install -D -m644 indent/json.vim "$pkgdir/usr/share/vim/vimfiles/indent/json.vim"
	install -D -m644 syntax/json.vim "$pkgdir/usr/share/vim/vimfiles/syntax/json.vim"
}
