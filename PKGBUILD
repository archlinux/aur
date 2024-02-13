pkgname=neovim-comment-opt-git
pkgver=237.0236521
_pkgname=comment
pkgrel=1
pkgdesc='Smart and powerful comment plugin for Neovim.'
arch=('any')
url="https://github.com/numToStr/${_pkgname}.nvim"
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

    cp -rvt "${pkgdir}/${_installpath}" doc lua plugin

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
