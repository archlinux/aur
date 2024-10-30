# Maintainer: Atte Lautanala <atte@lautana.la>

_name=auto-session
pkgname=neovim-auto-session
pkgver=2.5.0
pkgrel=1
pkgdesc="A small automated session manager for Neovim"
arch=('any')
url="https://github.com/rmagatti/$_name"
license=('MIT')
groups=('neovim-plugins')
depends=('neovim')
source=("$url/archive/v$pkgver/$_name-$pkgver.tar.gz")
b2sums=('50e15af2e6602c8695c63ec0b8d4e8441d66f49a7175fa2a967aff295ec93f18604f454c4dd6b6638958ce77c666d179ac6e6f3776ab21bfa98735b67931cbd0')

package() {
	cd "$_name-$pkgver"

	find doc lua -type f -exec \
		install -Dm0644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/auto-session/{}" \;
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
