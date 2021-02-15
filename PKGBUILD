# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=neovim-polyglot-git
pkgver=4.4.3.r9.g56121b4
pkgrel=1
pkgdesc='A solid language pack for Vim.'
arch=('any')
url='https://github.com/sheerun/vim-polyglot'
license=('MIT')
depends=('neovim')
makedepends=('git')
provides=('neovim-polyglot')
conflicts=('neovim-polyglot')
source=('git+https://github.com/sheerun/vim-polyglot.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vim-polyglot"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/vim-polyglot"
    find after autoload compiler ctags extras ftdetect ftplugin indent syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/vim-polyglot/start/vim-polyglot/{}" \;
}

