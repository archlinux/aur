pkgname=neovim-plenary-opt-git
_pkgname=plenary
pkgver=326.36aaceb
pkgrel=1
pkgdesc="All the lua functions (for neovim) I don't want to write twice."
arch=('any')
url="https://github.com/nvim-lua/${_pkgname}.nvim"
license=('MIT')
provides=('plenary.nvim')
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

    cp -rvt "${pkgdir}/${_installpath}" data doc lua plugin scripts

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
