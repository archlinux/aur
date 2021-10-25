# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-pisces
pkgver=0.7.0
pkgrel=2
pkgdesc="Fish plugin for matching paired symbols"
arch=('any')
url="https://github.com/laughedelic/pisces"
license=('LGPL3')
groups=('fish-plugins')
depends=('fish>=2.3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8ba93c5f8c032b13e0578b69833bdb3a78e8b97d5759335d9c61c1c46445a17a')

package() {
	cd "pisces-$pkgver"
	install -Dm 644 conf.d/pisces.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
	find functions -type f -exec install -Dm 644 -t "$pkgdir/usr/share/fish/vendor_functions.d/" '{}' \+
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
