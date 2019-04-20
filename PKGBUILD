pkgname=neovim-suda-opt-git
_pkgname=suda
pkgver=20.5fb3266
pkgrel=1
pkgdesc='An alternative to sudo.vim for (neo)vim.'
arch=('any')
url="https://github.com/lambdalisue/${_pkgname}.vim"
license=('MIT')
depends=('neovim')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}.vim"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}.vim"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" autoload doc plugin

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
