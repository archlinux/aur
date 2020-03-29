pkgname=neovim-undotree-opt-git
_pkgname=undotree
pkgver=175.be23eac
pkgrel=1
pkgdesc='The undo history visualizer for (neo)vim.'
arch=('any')
url="https://github.com/mbbill/undotree"
license=('custom:vim')
depends=('neovim')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" autoload doc plugin syntax

}
