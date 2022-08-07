# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=fish-catppuccin-git
pkgname=(
	'fish-catppuccin-frappe-git'
	'fish-catppuccin-latte-git'
	'fish-catppuccin-macchiato-git'
	'fish-catppuccin-mocha-git')
_pkg="${pkgbase%-git}"
pkgver=r54.cb79527
pkgrel=2
pkgdesc="Soothing pastel theme for Fish Shell"
arch=('any')
url='https://github.com/catppuccin/fish'
license=('MIT')
depends=('fish')
makedepends=('git')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_package() {
	cd "$_pkg"
	install -Dm644 conf.d/$1.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_fish-catppuccin-frappe-git() {
	pkgdesc+=' -- Frappe colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package frappe
}

package_fish-catppuccin-latte-git() {
	pkgdesc+=' -- Latte colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package latte
}

package_fish-catppuccin-macchiato-git() {
	pkgdesc+=' -- Macchiato colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package macchiato
}

package_fish-catppuccin-mocha-git() {
	pkgdesc+=' -- Mocha colorscheme'
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	_package mocha
}
