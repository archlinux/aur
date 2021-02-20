# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_variant='vim'
_extname=coc-vimtex
_packdir="usr/share/vim/vimfiles/pack/coc/start/${_extname}"
url='https://github.com/neoclide/coc-vimtex'
pkgdesc='vimtex integration for coc.nvim'

pkgname="${_variant}-${_extname}-git"
provides=("${_variant}-${_extname}")
conflicts=("${_variant}-${_extname}")
arch=('any')
depends=("${_variant}-coc" "vim-vimtex")
makedepends=('git')
license=('MIT')
source=("${_extname}::git+${url}.git")
pkgver=1.0.4.r2.g993436f
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_extname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    chown -R root:root "${pkgdir}"
}
