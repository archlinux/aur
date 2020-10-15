pkgname=neovim-wordmotion-opt-git
_pkgname=wordmotion
pkgver=110.257a59c
pkgrel=1
pkgdesc='More useful word motions for (neo)vim.'
arch=('any')
url="https://github.com/chaoren/vim-${_pkgname}"
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

    cp -rvt "${pkgdir}/${_installpath}" autoload doc plugin  

}
