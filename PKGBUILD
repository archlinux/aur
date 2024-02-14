pkgname=neovim-luasnip-opt-git
_pkgname=luasnip
pkgver=2076.2dbef19
pkgrel=1
pkgdesc='LuaSnip is a snippet-engine written entirely in lua.'
arch=('any')
url="https://github.com/L3MON4D3/${_pkgname}"
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

    cp -rt "${pkgdir}/${_installpath}" doc ftplugin lua plugin syntax

}
