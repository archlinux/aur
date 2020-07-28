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
license=('')
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
    _extname=syntax
    pkgdesc='Words from syntax list'
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
    pkgdesc='Words from tagfiles()'
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
    pkgdesc='Words from files in &dictionary'
    depends=('vim-coc' 'words')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-word-git() {
    _extname=word
    pkgdesc='Words from google 10000 english repo'
    depends=('vim-coc')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_vim-coc-emoji-git() {
    _extname=emoji
    pkgdesc='Emoji words for markdown'
    depends=('vim-coc' 'words')
    _packdir="usr/share/vim/vimfiles/pack/coc/start/coc-${_extname}"
    provides=("vim-coc-${_extname}")
    conflicts=("vim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
