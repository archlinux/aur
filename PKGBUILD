pkgname=neovim-telescope-fzf-native-opt-git
_pkgname=telescope-fzf-native
pkgver=63.6c921ca
pkgrel=1
pkgdesc='FZF sorter for neovim-telescope written in C.'
arch=('any')
url="https://github.com/nvim-telescope/telescope-fzf-native.nvim"
license=('MIT')
depends=('neovim' 'neovim-telescope')
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

    cp -rvt "${pkgdir}/${_installpath}" lua src

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
