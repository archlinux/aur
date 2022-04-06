# Maintainer: Your Name <youremail@domain.com>
pkgname=vim-fontsize
pkgver=0.4.1
pkgrel=1
pkgdesc="Adjust Gvim font size via keypresses"
arch=("any")
url="https://github.com/drmikehenry/vim-fontsize"
depends=(gvim)
license=("unknown")

source=("https://github.com/drmikehenry/vim-fontsize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('539ac53c4375b7c1c81f08ff28a850a43fb0fa083dd8947d7e0c6f640ee281c2')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find autoload doc plugin -type f -exec \
        install -Dm 644 '{}' "${_installpath}/{}" \;
}

