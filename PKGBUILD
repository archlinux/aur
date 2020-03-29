pkgname=neovim-swap-opt-git
_pkgname=swap
pkgver=215.e52ff67
pkgrel=1
pkgdesc='Reorder delimited items.'
arch=('any')
url="https://github.com/machakann/vim-swap"
license=('custom:vim')
depends=('neovim')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/vim-${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/vim-${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" autoload doc plugin

}
