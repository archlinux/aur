pkgname=neovim-polyglot-git
pkgver=r540.56121b4
pkgrel=1
pkgdesc='A solid language pack for Vim.'
arch=('any')
url='https://github.com/sheerun/vim-polyglot'
license=('')
depends=('neovim')
makedepends=('git')
provides=('neovim-polyglot')
conflicts=('neovim-polyglot')
source=('git+https://github.com/sheerun/vim-polyglot.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vim-polyglot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/vim-polyglot"
    find after autoload compiler ctags extras ftdetect ftplugin indent syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/nvim/runtime/pack/vim-polyglot/start/vim-polyglot/{}" \;
}

