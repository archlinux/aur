pkgname=neovim-lspconfig
pkgver=e609a70
pkgrel=1
pkgdesc='Quickstart configurations for the Nvim LSP client.'
arch=('any')
url=https://github.com/neovim/nvim-lspconfig
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-plug' 'lua')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
_luajitver=2.0.5
package(){
    cd "${srcdir}/nvim-lspconfig"
    install -Dm644 "plugin/lspconfig.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/lspconfig.vim"
    mkdir -p "${pkgdir}/usr/share/luajit-${_luajitver}"
    cp -a lua/* "${pkgdir}/usr/share/luajit-${_luajitver}/"
}
pkgver(){
    cd "${srcdir}/nvim-lspconfig"
    git rev-parse --short HEAD
}
