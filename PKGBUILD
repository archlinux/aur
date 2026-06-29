# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icinga-php-thirdparty
pkgver=0.15.3
pkgrel=1
pkgdesc="Bundle for all 3rd party PHP libraries used by Icinga Web products"
arch=(any)
url="https://github.com/Icinga/icinga-php-thirdparty"
license=('Apache-2.0 AND BSD-3-Clause AND ISC AND LGPL-2.1-only AND LGPL-2.1-or-later AND LGPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icinga-php-thirdparty/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c0c57ded154bca89ead398e5f26ec8c118b2e9c5bddc94d14bee219bc216097')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/icinga-php"
	cp -rT . "$pkgdir/usr/share/icinga-php/vendor"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
	install -Dm644 THIRD_PARTY_LICENSES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
}
