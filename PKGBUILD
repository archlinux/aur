pkgname=neovim-lspconfig-opt-git
_pkgname=lspconfig
pkgver=2590.38da5bbe
pkgrel=1
pkgdesc='Configs for the neovim LSP client (:help lsp).'
arch=('any')
url="https://github.com/neovim/nvim-lspconfig"
license=('Apache')
depends=('neovim')
makedepends=('git')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rt "${pkgdir}/${_installpath}" doc lua plugin scripts

}
