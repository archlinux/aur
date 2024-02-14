pkgname=neovim-cmp-opt-git
_pkgname=cmp
pkgver=703.e1f1b40
pkgrel=1
pkgdesc='A completion engine plugin for neovim written in Lua.'
arch=('any')
url="https://github.com/hrsh7th/nvim-cmp"
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

local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rt "${pkgdir}/${_installpath}" autoload doc lua plugin utils

}
