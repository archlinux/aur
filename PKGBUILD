# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=neovim-hybrid
url='https://github.com/w0ng/vim-hybrid'
_commit=cc58baabeabc7b83768e25b852bf89c34756bf90
arch=('any')
license=('MIT')
makedepends=()
depends=('neovim')
groups=('neovim-plugins')
pkgver=r46.cc58baa
pkgrel=4
pkgdesc='A dark color scheme for Neovim'
source=("https://github.com/w0ng/vim-hybrid/archive/$_commit.zip")
sha256sums=('50b496f0a2e94b2d05066344ba08af60d490aa4ce9edc9976c90ccd6796d63c3')

prepare() {
    cd "vim-hybrid-$_commit"
    tail -28 colors/hybrid.vim | head -26 | cut -b3- > LICENSE
}

package() {
    cd "vim-hybrid-$_commit"
    install -Dvm644 colors/hybrid.vim "$pkgdir/usr/share/nvim/runtime/colors/hybrid.vim"
    install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
