pkgname=nvim-cmp
pkgver=f5393d5
pkgrel=1
pkgdesc='A completion plugin for neovim coded in Lua.'
arch=('any')
url=https://github.com/hrsh7th/nvim-cmp
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'lua' 'cmp-nvim-lsp' 'cmp-buffer')
makedepends=('git')
optdependss=('neovim-plug: for plugin manager')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/nvim-cmp"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    install -Dm644 "plugin/cmp.lua" "${pkgdir}/usr/share/nvim/runtime/plugin/cmp.lua"
    cp -a "lua" "${pkgdir}/usr/share/nvim/runtime/"
    cp -a "autoload" "${pkgdir}/usr/share/nvim/runtime/"
}
pkgver(){
    cd "${srcdir}/nvim-cmp"
    git rev-parse --short HEAD
}
