# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgbase=vim-coc-sources-git
pkgname=('vim-coc-syntax-git'
         'vim-coc-tag-git'
         'vim-coc-dictionary-git')
arch=('any')
url='https://github.com/neoclide/coc-sources'
makedepends=('git')
license=('')
groups=('vim-coc-extras')
source=("coc-sources::git+${url}.git")
pkgver=1.2.5.r0.ga2f059e
pkgrel=1
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/coc-sources"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_vim-coc-syntax-git() {
    _extname=syntax
    pkgdesc='Syntax words completion source for coc.nvim'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-tag-git() {
    _extname=tag
    pkgdesc='tag source for coc.nvim'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-dictionary-git() {
    _extname=dictionary
    pkgdesc='dictionary source for coc.nvim'
    depends=('vim-coc' 'words')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
