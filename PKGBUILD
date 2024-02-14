pkgname=neovim-neodev-opt-git
_pkgname=neodev
pkgver=692.a098813
pkgrel=1
pkgdesc='Full signature help, docs, and completion for the nvim lua API.'
arch=('any')
url="https://github.com/folke/${_pkgname}.nvim"
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

    cp -rt "${pkgdir}/${_installpath}" doc lua types

}
