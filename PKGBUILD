pkgname=neovim-ale-opt-git
_pkgname=ale
pkgver=2966.80ef7ea2
pkgrel=1
pkgdesc='Asynchronous linting/fixing engine for (neo)vim.'
arch=('any')
url="https://github.com/w0rp/${_pkgname}"
license=('BSD')
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

    cp -rvt "${pkgdir}/${_installpath}" ale_linters autoload doc ftplugin plugin syntax

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
