# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=neovim-qml
url="https://github.com/peterhoeg/vim-qml"
_commit=892c36a80a8711025af7bb9d09a8a6b90fe3d0c8
arch=('any')
license=('unknown')
makedepends=()
depends=('neovim')
groups=('neovim-plugins')
pkgver=r57.892c36a
pkgrel=1
pkgdesc='QML syntax highlighting for Neovim'
source=("https://github.com/peterhoeg/vim-qml/archive/$_commit.zip")
sha256sums=('63104486b1bdb4a7619dc89ec6b31443078f1087e6e18636d0acf675fcbdf034')

package() {
    _installdir="$pkgdir/usr/share/nvim/runtime"
    cd "vim-qml-$_commit"

    for d in ftdetect ftplugin indent syntax
    do
        install -Dvm644 "$d/qml.vim" "$_installdir/$d/qml.vim"
    done
}
