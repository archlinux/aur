# Maintainer: Nekosis <37462865+Nekosis@users.noreply.github.com>
pkgname=sleepyneko-git
pkgver=r9.848835e
pkgrel=1
pkgdesc="Minimalist Neovim configuration with the lazy.nvim package manager"
arch=('any')
url="https://github.com/Nekosis/sleepyneko"
license=('GPL')
depends=('neovim' 'git' 'tree-sitter' 'tree-sitter-cli' 'nodejs' 'gcc' 'ripgrep' 'fd' )
optdepends=('xclip: clipboard support (X11)'
	        'wl-clipboard: clipboard support (Wayland)')
source=('git+https://github.com/Nekosis/sleepyneko.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"
	mkdir -p $pkgdir/etc/skel/.config/
	cp -r ${pkgname%-git}/ $pkgdir/etc/skel/.config/nvim/
}
