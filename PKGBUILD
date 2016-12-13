# Maintainer: Peter Varo <hello@petervaro.com>

pkgname=vim-neocomplete-git
pkgver=r885.14ae00a
pkgver() {
    cd "neocomplete.vim"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="Next generation completion framework after neocomplcache"
arch=('any')
url="https://github.com/Shougo/neocomplete.vim"
license=('MIT')
groups=('vim-plugins')
makedepends=('git')
install='vimdoc.install'
source=("git://github.com/Shougo/neocomplete.vim.git"
        "LICENSE")
md5sums=('SKIP' 'SKIP')

package() {
    cd "neocomplete.vim"
    _installpath="$pkgdir/usr/share/vim/vimfiles"
    install -Dm755 doc/neocomplete.txt "$_installpath/doc/neocomplete.txt"
    install -Dm755 plugin/neocomplete.vim "$_installpath/plugin/neocomplete.vim"
    install -d "$_installpath/plugin/neocomplete"
	cp -R plugin/neocomplete/* "$_installpath/plugin/neocomplete"
	install -d "$_installpath/autoload"
	cp -R autoload/* "$_installpath/autoload"
    install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

