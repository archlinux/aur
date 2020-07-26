pkgname=vim-polyglot-git
pkgver=r540.56121b4
pkgrel=1
pkgdesc='A solid language pack for Vim.'
arch=('any')
url='https://github.com/sheerun/vim-polyglot'
license=('')
depends=('vim')
makedepends=('git')
provides=('vim-polyglot')
conflicts=('vim-polyglot')
source=('git+https://github.com/sheerun/vim-polyglot.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/vim-polyglot"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/vim-polyglot"
    find after autoload compiler ctags extras ftdetect ftplugin indent syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/vim-polyglot/start/vim-polyglot/{}" \;
}

