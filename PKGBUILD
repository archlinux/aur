# Maintainer: Thomas Letan <lthms@soap.coffee>

_pluginname=neovim-bepo-tsrn
pkgname="$_pluginname-git"
pkgver=r2.ac82e3d
pkgrel=1
pkgdesc='Opinionated mappings for the bepo layout in Lua'
arch=('any')
url='https://github.com/lthms/bepo-tsrn.nvim'
_reponame="${url##*/}"
license=('Apache-2.0')
depends=('neovim')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${_reponame}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pluginname}/LICENSE"
    install -Dm 644 plugin/bepo-tsrn.lua "${pkgdir}/usr/share/vim/vimfiles/global/bepo-tsrn.lua"
}
