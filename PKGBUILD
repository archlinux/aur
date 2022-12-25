# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
pkgname=vim-arm-syntax-git
pkgver=r58.e0abb52
pkgrel=1
pkgdesc="ARMv4 through 7 syntax highlighting for vim"
arch=('any')
url="https://github.com/ARM9/arm-syntax-vim"
license=('unknown')
groups=()
depends=('vim-plugin-runtime')
makedepends=('git')
source=("git+https://github.com/ARM9/arm-syntax-vim#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/arm-syntax-vim"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/arm-syntax-vim"

    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find syntax -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
