# Maintainer: Gabriel Hansson <gabrielhansson00 at gmail dot com>
pkgname=mason-lspconfig.nvim
pkgver=r63.4674ed1
pkgrel=1
pkgdesc="Bridge mason.nvim with neovim-lspconfig"
arch=('any')
url="https://github.com/williamboman/mason-lspconfig.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('mason.nvim' 'neovim-lspconfig')
makedepends=('git')
install=mason-lspconfig.nvim.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md doc/server-mapping.md -t "$pkgdir/usr/share/doc/$pkgname/"
	find lua doc/mason-lspconfig.txt -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
}
