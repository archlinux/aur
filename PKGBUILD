pkgname=neovim-commentary-opt-git
_pkgname=commentary
pkgver=55.f8238d7
pkgrel=1
pkgdesc='Comment stuff out.'
arch=('any')
url="https://github.com/tpope/vim-${_pkgname}"
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

    cp -rvt "${pkgdir}/${_installpath}" doc plugin

}
