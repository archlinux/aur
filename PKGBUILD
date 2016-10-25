# Maintainer: 0x47

pkgname=vim-colorscheme-unsuck-flat-git
_instname=vim-colorscheme-unsuck-flat
_gitname=unsuck-flat
pkgver=1.be38bc4
pkgver() {
	cd "$_gitname" || exit
	echo "$(git rev-list --count master).$(git rev-parse --short master)"
}
pkgrel=1
pkgdesc="A Vim / GVim color scheme that tries not to suck as hard as the existing ones"

arch=('any')
url='https://github.com/unsuckvim/unsuck-flat'
license=('GPL3')
depends=('vim')
conflicts=($_instname)
makedepends=('git')
source=('git+https://github.com/unsuckvim/unsuck-flat.git')
sha256sums=('SKIP')

package() {
	install_dir="$pkgdir/usr/share/vim/vimfiles/colors"
	install -dm755 $install_dir
	install -Dm644 "$srcdir/$_gitname/unsuck-flat.vim" $install_dir/
}

