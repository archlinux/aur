# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=neovim-telescope-coc-git
_pkgname="${pkgname%-git}"
pkgver=r52.ga1aaabd
pkgrel=1
pkgdesc="coc.nvim integration for telescope.nvim"
arch=('any')
url="https://github.com/fannheyward/telescope-coc.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim' 'neovim-telescope')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	echo r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)
}

package() {
	cd "$pkgname"
	find lua \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
}

