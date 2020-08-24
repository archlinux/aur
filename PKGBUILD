# vim-markdown-toc

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=vim-markdown-toc-git
_pkgname=${pkgname%-*}
pkgver=v1.4.0.r30.g2e86c72
pkgrel=2
pkgdesc='A vim 7.4+ plugin to generate table of contents for Markdown files.'
arch=('any')
url='https://github.com/mzlogin/vim-markdown-toc'
license=('MIT')
depends=('vim')
conflicts=('vim-markdown-toc')
source=("git+https://github.com/mzlogin/$_pkgname")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	vimfiles="$pkgdir/usr/share/vim/vimfiles"

	cd "$srcdir/$_pkgname"
	install -dv "$vimfiles"
	cp -R ftdetect ftplugin "$vimfiles/"
}

