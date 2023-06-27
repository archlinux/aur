# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=vim-zoom
pkgver=0.3.4
pkgrel=1
pkgdesc="Toggle zoom in / out individual windows (splits)"
arch=("any")
url="https://github.com/dhruvasagar/vim-zoom"
depends=(vim)
license=("MIT")

source=($pkgname-$pkgver.tar.gz::"${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5ad53b9d1dab364870b9ce8a33aaf9dd423ce0190b65e36fc41f543b4ce21610')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find autoload doc plugin -type f -exec \
    install -Dm 644 '{}' "${_installpath}/{}" \;
}
