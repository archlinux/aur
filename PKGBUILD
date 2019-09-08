# Maintainer: Jinyi Xian <kylerky@live.com>
pkgname=vim-slime-git
pkgver=r273.dc8ca22
pkgrel=1
pkgdesc="A vim plugin for REPL."
arch=('i686' 'x86_64')
url="https://github.com/jpalardy/vim-slime"
license=('MIT')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/jpalardy/vim-slime.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 644 doc/vim-slime.txt -t "$pkgdir/usr/share/vim/vimfiles/doc/"
	install -Dm 644 plugin/slime.vim  -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
        cp -a autoload ftplugin "$pkgdir/usr/share/vim/vimfiles/"
}
