# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=neovim-lsp-signature-git
pkgver=r120.ef20fad
pkgrel=2
pkgdesc="Neovim plugin for showing LSP signature hints"
arch=('any')
url="https://github.com/ray-x/lsp_signature.nvim"
license=('Apache')
groups=('neovim-plugins')
depends=('neovim>=0.5.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dvm 644 lua/lsp_signature.lua lua/lsp_signature_helper.lua -t "$pkgdir/usr/share/nvim/runtime/lua/"
	install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
