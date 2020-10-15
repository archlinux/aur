pkgname=neovim-targets-opt-git
_pkgname=targets
pkgver=689.8d6ff29
pkgrel=1
pkgdesc='A (neo)vim plugin that adds various text objects to give you more targets to operate on.'
arch=('any')
url="https://github.com/wellle/${_pkgname}.vim"
license=('MIT')
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
