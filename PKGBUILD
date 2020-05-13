pkgname=neovim-togglelist-opt-git
_pkgname=togglelist
pkgver=12.cafedc4
pkgrel=1
pkgdesc='Functions to toggle the Location List and the Quickfix List windows.'
arch=('any')
url="https://github.com/milkypostman/vim-${_pkgname}"
license=('custom:vim')
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

    cp -rvt "${pkgdir}/${_installpath}" plugin

}
