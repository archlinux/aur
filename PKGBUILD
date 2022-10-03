# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode
pkgver=0.2.1
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugin')
depends=('neovim')
install=orgmode.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('acb96392beeb78aa6115ac21ac374fde686033d3fbfcc479ab568ce40c764477')

package() {
	cd "orgmode-$pkgver"
	find doc ftdetect ftplugin indent lua syntax -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md DOCS.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
