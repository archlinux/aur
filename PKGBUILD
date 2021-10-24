# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-abbreviation-tips
pkgver=0.5.1
pkgrel=3
pkgdesc="Alias abbreviation tips for fish shell"
arch=('any')
url="https://github.com/gazorby/fish-abbreviation-tips"
license=('MIT')
groups=('fish-plugins')
depends=('fish>=3.1.0')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3d4a323d8b854e87af818a3831c2d696fcfd8cb605f394c8d333bbac9411ce99')

package() {
	cd "$pkgname-$pkgver"
	install -Dm 644 conf.d/abbr_tips.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	find functions -type f -exec install -Dm644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
}
