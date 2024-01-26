# Maintainer: Phuong Phan <pmphan00 at gmail dot com>

pkgname=nvim-lazy
pkgrel=1
epoch=1
pkgver=v10.16.0
pkgdesc="A modern plugin manager for Neovim."
arch=("any")
url="https://github.com/folke/lazy.nvim"
_srcfolder="${url##*/}"
license=("Apache")
depends=("neovim")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("SKIP")

package() {
    cd "${_srcfolder}-${pkgver##*v}"
    find doc lua -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/nvim/site/pack/lazy/start/lazy.nvim/{}" \;
    install -Dm 666 /dev/null "${pkgdir}/usr/share/nvim/site/pack/lazy/start/lazy.nvim/doc/tags"
}
