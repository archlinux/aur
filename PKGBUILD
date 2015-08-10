# Maintainer: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=neovim-symlinks
pkgver=1.0.1
pkgrel=1
pkgdesc="System-wide: Runs neovim if vi or vim is invoked."
arch=('any')
license=('MIT')
depends=('neovim-git')
provides=('vim' 'vi')
conflicts=('vim' 'vi' 'vi-vim-symlink')
source=()
sha256sums=()

package() {
    install -dm755 "$pkgdir/usr/bin"

    _link_names=(edit ex rview rvim vedit vi view vim)
    for link in "${_link_names[@]}";
    do
        ln -s nvim "$pkgdir/usr/bin/$link"
    done
}

