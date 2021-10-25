# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-systemd-git
pkgver=r10.4e922a2
pkgrel=2
pkgdesc="Comfortable fish aliases for systemctl commands"
arch=('any')
url="https://github.com/wawa19933/fish-systemd"
license=('Unlicense')
groups=('fish-plugins')
depends=('fish')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 conf.d/systemd-abbr.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm 644 functions/systemctl.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
