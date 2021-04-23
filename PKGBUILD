# Maintainer: John A. Leuenhagen

_pkgname=vim-ember-hbs
pkgname=$_pkgname-git
pkgver=r26.05adc50
pkgrel=1
pkgdesc="Ember Handlebars/HTMLBars plugin for Vim with indentation support"
arch=('any')
url="https://github.com/joukevandermaas/vim-ember-hbs"
license=('MIT')
depends=('vim')
makedepends=('git')
provides=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"

	mkdir -p "$pkgdir/usr/share/vim/vimfiles"
	cp -r ftdetect indent syntax "$pkgdir/usr/share/vim/vimfiles"
}
