# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-catppuccin-git
_pkg="${pkgname%-git}"
pkgver=r54.cb79527
pkgrel=1
pkgdesc="Soothing pastel theme for Fish Shell"
arch=('any')
url='https://github.com/catppuccin/fish'
license=('MIT')
depends=('fish')
makedepends=('git')
provides=(
	"${_pkg}-frappe"
	"${_pkg}-latte"
	"${_pkg}-macciato"
	"${_pkg}-mocha")
conflicts=(
	"${_pkg}-frappe"
	"${_pkg}-latte"
	"${_pkg}-macciato"
	"${_pkg}-mocha")
install=
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkg"
	install -Dm644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
