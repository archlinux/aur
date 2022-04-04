# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=vim-localvimrc-git
pkgver=r238.4c768d2
pkgrel=1
pkgdesc="Search local vimrc files in the tree and load them."
arch=('any')
url="https://github.com/embear/vim-localvimrc"
license=()
groups=()
depends=('vim-plugin-runtime')
makedepends=('git')
source=("git+https://github.com/embear/vim-localvimrc.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find doc plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
