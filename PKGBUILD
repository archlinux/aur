pkgname=neovim-matchup-opt-git
_pkgname=matchup
pkgver=299.afbf309
pkgrel=1
pkgdesc='A modern, drop-in replacement for matchit.vim and matchparen.'
arch=('any')
url="https://github.com/andymass/vim-${_pkgname}"
license=('MIT')
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

    cp -rvt "${pkgdir}/${_installpath}" after autoload doc plugin 
  
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
