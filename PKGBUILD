# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=vim-fontsize
pkgver=0.5.0
pkgrel=1
pkgdesc="Adjust Gvim font size via keypresses"
arch=("any")
url="https://github.com/drmikehenry/vim-fontsize"
depends=(gvim)
license=("custom:vim")

source=("https://github.com/drmikehenry/vim-fontsize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e75ac0cb151bc607c30419ec1749fd37e961c49c52d73b54bbfbab80d6e40016')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find autoload doc plugin -type f -exec \
    install -Dm 644 '{}' "${_installpath}/{}" \;
}

