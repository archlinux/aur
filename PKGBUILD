pkgname=neovim-lspinstall
pkgver=79ec242
pkgrel=1
pkgdesc='Provides the missing :LspInstall for nvim-lspconfig.'
arch=('any')
url=https://github.com/kabouzeid/nvim-lspinstall
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-lspconfig' 'lua')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
package(){
    cd "${srcdir}/nvim-lspinstall"
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    install -Dm644 "plugin/lspinstall.vim" "${pkgdir}/usr/share/nvim/runtime/plugin/lspinstall.vim"
    cp -a lua "${pkgdir}/usr/share/nvim/runtime"
}
pkgver(){
    cd "${srcdir}/nvim-lspinstall"
    git rev-parse --short HEAD
}
