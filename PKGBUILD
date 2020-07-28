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
license=('')
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
    _extname=syntax
    pkgdesc='Words from syntax list'
    depends=('neovim-coc')
    _packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
    provides=("neovim-coc-${_extname}")
    conflicts=("neovim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-tag-git() {
    _extname=tag
    pkgdesc='Words from tagfiles()'
    depends=('neovim-coc')
    _packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
    provides=("neovim-coc-${_extname}")
    conflicts=("neovim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-dictionary-git() {
    _extname=dictionary
    pkgdesc='Words from files in &dictionary'
    depends=('neovim-coc')
    _packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
    provides=("neovim-coc-${_extname}")
    conflicts=("neovim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-word-git() {
    _extname=word
    pkgdesc='Words from google 10000 english repo'
    depends=('neovim-coc')
    _packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
    provides=("neovim-coc-${_extname}")
    conflicts=("neovim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}

package_neovim-coc-emoji-git() {
    _extname=emoji
    pkgdesc='Emoji words for markdown'
    depends=('neovim-coc')
    _packdir="usr/local/share/nvim/site/pack/coc/start/${_extname}"
    provides=("neovim-coc-${_extname}")
    conflicts=("neovim-coc-${_extname}")
    cd "${srcdir}/coc-sources/packages/${_extname}"
    find . -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
}
