pkgname=neovim-lspinstall
pkgver=08ea726
pkgrel=1
pkgdesc='Provides the missing :LspInstall for nvim-lspconfig.'
arch=('any')
url=https://github.com/kabouzeid/nvim-lspinstall
license=('Apache')
groups=('neovim-plugins')
depends=('neovim' 'neovim-lspconfig' 'lua')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
_luajitver=2.0.5
package(){
    cd "${srcdir}/nvim-lspinstall"
    install -Dm644 "plugin/lspinstall.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/lspinstall.vim"
    mkdir -p "${pkgdir}/usr/share/luajit-${_luajitver}"
    cp -a lua/* "${pkgdir}/usr/share/luajit-${_luajitver}/"
}
pkgver(){
    cd "${srcdir}/nvim-lspinstall"
    git rev-parse --short HEAD
}
