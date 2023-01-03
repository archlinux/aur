# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=fish-catppuccin-git
pkgname=(
	'fish-catppuccin-frappe-git'
	'fish-catppuccin-latte-git'
	'fish-catppuccin-macchiato-git'
	'fish-catppuccin-mocha-git')
_pkg="${pkgbase%-git}"
pkgver=r61.b909666
pkgrel=1
pkgdesc="Soothing pastel theme for Fish Shell"
arch=('any')
url='https://github.com/catppuccin/fish'
license=('MIT')
depends=('fish')
makedepends=('git')
install=catppuccin.install
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
	cd "$_pkg"
	install -Dvm644 themes/"$1.theme" -t "$pkgdir/usr/share/fish/tools/web_config/themes/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_fish-catppuccin-frappe-git() {
	pkgdesc+=' -- Frappe colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package "Catppuccin Frappe"
}

package_fish-catppuccin-latte-git() {
	pkgdesc+=' -- Latte colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package "Catppuccin Latte"
}

package_fish-catppuccin-macchiato-git() {
	pkgdesc+=' -- Macchiato colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package "Catppuccin Macchiato"
}

package_fish-catppuccin-mocha-git() {
	pkgdesc+=' -- Mocha colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package "Catppuccin Mocha"
}
