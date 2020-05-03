pkgname=neovim-vimtex-opt-git
_pkgname=vimtex
pkgver=3262.9194c10d
pkgrel=1
pkgdesc='A modern (neo)vim plugin for editing LaTeX files.'
arch=('any')
url="https://github.com/lervag/${_pkgname}"
license=('MIT')
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

    cp -rvt "${pkgdir}/${_installpath}" after autoload compiler doc ftplugin indent
  
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
