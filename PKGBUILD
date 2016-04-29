# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>

_pkgname=vimperator
pkgname=$_pkgname-vim-syntax-git
pkgver=r31.6559e7b
pkgrel=1
pkgdesc="ViM syntax for Vimperator files"
arch=(any)
url="http://vimperator.org/vimperator"
license=(MIT)
depends=(vim)
source=('git+https://github.com/vimperator/vimperator.vim.git')
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname.vim"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local _destdir="$pkgdir/usr/share/vim/vim74"
    install -d "$_destdir"
    cd "$srcdir/$_pkgname.vim"
    cp -r {ftdetect,syntax} "$_destdir"
}
