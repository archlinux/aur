pkgname=neovim-coc-opt-git
_pkgname=coc
pkgver=724.473668ea
pkgrel=1
pkgdesc='Intellisense engine for neovim.'
arch=('any')
url="https://github.com/neoclide/${_pkgname}.nvim"
license=('MIT')
depends=('neovim' 'nodejs' 'yarn')
makedepends=('git')
optdepends=('npm: instead of yarn')
source=("${_pkgname}::git+${url}.git#branch=release")
sha256sums=('SKIP')


pkgver() {

    cd "${srcdir}/${_pkgname}"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"

}

package() {

    cd "${srcdir}/${_pkgname}"

    local _installpath="usr/local/share/nvim/site/pack/${_pkgname}/opt/${_pkgname}/"

    install -dvm755 "${pkgdir}/${_installpath}"

    cp -rvt "${pkgdir}/${_installpath}" autoload bin build data doc plugin package.json

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
