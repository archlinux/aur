# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=vim-coc-sources-git
pkgname=('vim-coc-syntax-git'
         'vim-coc-tag-git'
         'vim-coc-dictionary-git'
         'vim-coc-word-git'
         'vim-coc-emoji-git')
arch=('any')
url='https://github.com/neoclide/coc-sources'
makedepends=('git')
license=('MIT')
groups=('vim-coc-extras-git')
source=("coc-sources::git+${url}.git")
pkgver=1.2.5.r0.ga2f059e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc-sources"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_vim-coc-syntax-git() {
    pkgdesc='Syntax words completion source for coc.nvim'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-syntax"
    provides=("vim-coc-syntax")
    conflicts=("vim-coc-syntax")
    cd "${srcdir}/coc-sources/packages/syntax"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-tag-git() {
    pkgdesc='tag source for coc.nvim'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-tag"
    provides=("vim-coc-tag")
    conflicts=("vim-coc-tag")
    cd "${srcdir}/coc-sources/packages/tag"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-dictionary-git() {
    pkgdesc='dictionary source for coc.nvim'
    depends=('vim-coc' 'words')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-dictionary"
    provides=("vim-coc-dictionary")
    conflicts=("vim-coc-dictionary")
    cd "${srcdir}/coc-sources/packages/dictionary"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-word-git() {
    pkgdesc='word source for coc.nvim'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-word"
    provides=("vim-coc-word")
    conflicts=("vim-coc-word")
    cd "${srcdir}/coc-sources/packages/word"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-emoji-git() {
    pkgdesc='emoji source for coc.nvim'
    depends=('vim-coc' 'words')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-emoji"
    provides=("vim-coc-emoji")
    conflicts=("vim-coc-emoji")
    cd "${srcdir}/coc-sources/packages/emoji"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
