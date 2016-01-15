# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>

_pkgname=vimperator
pkgname=$_pkgname-vim-syntax-git
pkgver=3.10.1.r78.gbdbdefa
pkgrel=1
pkgdesc="ViM syntax for Vimperator files"
arch=(any)
url="http://vimperator.org/vimperator"
license=(MIT)
depends=(vim)
source=('git+https://github.com/vimperator/vimperator-labs.git')
sha256sums=(SKIP)

pkgver() {
    cd "$_pkgname-labs"
    git describe --long --tags | sed 's/^vimperator-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    local _destdir="$pkgdir/usr/share/vim/vim74"
    install -d "$_destdir"
    cd "$srcdir/$_pkgname-labs/vimperator/contrib/vim"
    cp -r {ftdetect,syntax} "$_destdir"
}
