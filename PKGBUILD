# Maintainer: Márton Szabó <notramo@vipmail.hu>

pkgname='nvim-crystal-git'
pkgver=r148.dd5470e
pkgrel=1
pkgdesc="nvim filetype and tools support for Crystal language."
arch=('any')
url="https://github.com/rhysd/vim-crystal"
license=('MIT')
depends=('neovim')
makedepends=('git')
provides=('nvim-crystal')
conflicts=('nvim-crystal')
source=('nvim-crystal::git+https://github.com/rhysd/vim-crystal.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/nvim-crystal"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/nvim-crystal"
    install -d "$pkgdir/usr/share/nvim/runtime/"
    cp -r 'autoload' 'ftdetect' 'ftplugin' 'indent' 'plugin' 'syntax' "$pkgdir/usr/share/nvim/runtime"
}
