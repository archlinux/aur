# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=neovim-coc-sources-git
pkgname=('neovim-coc-syntax-git'
         'neovim-coc-tag-git'
         'neovim-coc-dictionary-git'
         'neovim-coc-word-git'
         'neovim-coc-emoji-git')
arch=('any')
url='https://github.com/neoclide/coc-sources'
makedepends=('git')
license=('MIT')
groups=('neovim-coc-extras-git')
source=("coc-sources::git+${url}.git")
pkgver=1.2.5.r0.ga2f059e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc-sources"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_neovim-coc-syntax-git() {
    pkgdesc='Syntax words completion source for coc.nvim'
    depends=('neovim-coc')
    _packdir="usr/share/nvim/runtime/pack/coc/start/syntax"
    provides=("neovim-coc-syntax")
    conflicts=("neovim-coc-syntax")
    cd "${srcdir}/coc-sources/packages/syntax"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-tag-git() {
    pkgdesc='tag source for coc.nvim'
    depends=('neovim-coc')
    _packdir="usr/share/nvim/runtime/pack/coc/start/tag"
    provides=("neovim-coc-tag")
    conflicts=("neovim-coc-tag")
    cd "${srcdir}/coc-sources/packages/tag"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-dictionary-git() {
    pkgdesc='dictionary source for coc.nvim'
    depends=('neovim-coc')
    _packdir="usr/share/nvim/runtime/pack/coc/start/dictionary"
    provides=("neovim-coc-dictionary")
    conflicts=("neovim-coc-dictionary")
    cd "${srcdir}/coc-sources/packages/dictionary"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-word-git() {
    pkgdesc='word source for coc.nvim'
    depends=('neovim-coc')
    _packdir="usr/share/nvim/runtime/pack/coc/start/word"
    provides=("neovim-coc-word")
    conflicts=("neovim-coc-word")
    cd "${srcdir}/coc-sources/packages/word"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-emoji-git() {
    pkgdesc='emoji source for coc.nvim'
    depends=('neovim-coc')
    _packdir="usr/share/nvim/runtime/pack/coc/start/emoji"
    provides=("neovim-coc-emoji")
    conflicts=("neovim-coc-emoji")
    cd "${srcdir}/coc-sources/packages/emoji"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
