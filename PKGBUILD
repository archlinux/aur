# Maintainer: Adam S Levy <adam@aslevy.com>
pkgname=vim-tickscript-git
_pkgname=${pkgname%-git}
pkgver=r8.399e332
pkgrel=1
pkgdesc="Vim syntax highlighting for TICKscript"
arch=('any')
url="https://github.com/nathanielc/vim-tickscript"
license=('MIT')
depends=('vim')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/nathanielc/vim-tickscript')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        # Git, no tags available
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/$_pkgname"
	install --directory "${pkgdir}/usr/share/vim/vimfiles/"
	for dir in autoload/ ftdetect/ plugin/ syntax/; do
		cp --recursive "${dir}" "${pkgdir}/usr/share/vim/vimfiles/"
	done
}
