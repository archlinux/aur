# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-magic
pkgver=0.3.1
pkgrel=1
pkgdesc="Pluggable framework for using AI code assistance"
arch=('any')
url="https://github.com/jameshiew/nvim-magic"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim>=0.5.0' 'curl' 'neovim-plenary' 'neovim-nui')
install=magic.install
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('ce12efbf05354914a0577840474b9725f1b7cba42f660ff93c333790cd674a00')

package() {
	cd "nvim-magic-$pkgver"
	find lua prompts -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
	find docs -type f -name '*.md' -exec install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" '{}' \+
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
