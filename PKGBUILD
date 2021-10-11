pkgname=completion-nvim
pkgver=139fb6c
pkgrel=1
pkgdesc='A async completion framework aims to provide completion to neovim.'
arch=('any')
url=https://github.com/nvim-lua/completion-nvim
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plug' 'lua')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/completion-nvim"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    install -Dm644 "plugin/completion.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/completion.vim"
    cp -a lua "${pkgdir}/usr/share/nvim/runtime/"
}
pkgver(){
    cd "${srcdir}/completion-nvim"
    git rev-parse --short HEAD
}
