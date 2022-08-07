# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tuhana GAYRETLİ <tuhana at cok dot gay>
# shellcheck disable=SC2034,SC2148,SC2164,SC2154,SC2128

pkgname=(
  catppuccin-frappe-grub-theme-git
  catppuccin-latte-grub-theme-git
  catppuccin-macchiato-grub-theme-git
  catppuccin-mocha-grub-theme-git)
pkgbase=catppuccin-grub-theme-git
_pkg="${pkgbase%-git}"
pkgver=r25.4f6ac65
pkgrel=2
pkgdesc='Soothing pastel theme for GRUB2'
arch=('any')
url='https://github.com/catppuccin/grub'
license=('MIT')
makedepends=('git')
source=("$_pkg::git+$url")
sha256sums=('SKIP')

_package() {
	cd "$_pkg/src"
	find "$1" \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/grub/themes/{}" \;
	install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_catppuccin-frappe-grub-theme-git() {
	pkgdesc+=' -- Frappe colorscheme'
	install=$pkgname.install

	_package catppuccin-frappe-grub-theme
}

package_catppuccin-latte-grub-theme-git() {
	pkgdesc+=' -- Latte colorscheme'
	install=$pkgname.install

	_package catppuccin-latte-grub-theme
}

package_catppuccin-macchiato-grub-theme-git() {
	pkgdesc+=' -- Macchiato colorscheme'
	install=$pkgname.install

	_package catppuccin-macchiato-grub-theme
}

package_catppuccin-mocha-grub-theme-git() {
	pkgdesc+=' -- Mocha colorscheme'
	install=$pkgname.install

	_package catppuccin-mocha-grub-theme
}
