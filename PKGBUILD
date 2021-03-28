# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-coc-zsh-git
pkgver=r3.ef6b0ca
pkgrel=1
pkgdesc='coc.nvim source for Zsh completions'
arch=('any')
url='https://github.com/tjdevries/coc-zsh'
license=('unknown')
depends=('vim-coc' 'zsh')
makedepends=('git')
provides=('vim-coc-zsh')
conflicts=('vim-coc-zsh')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc-zsh"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/coc-zsh"
    find autoload -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc-zsh/{}" \;
    find bin -type f -exec \
        install -Dm 755 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/coc/start/coc-zsh/{}" \;
}
