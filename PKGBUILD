# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=aptik
pkgver=18.8
pkgrel=3
pkgdesc="Command-line tool for migrating system settings and data"
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik"
license=('GPL3')
depends=('dconf' 'json-glib' 'libgee' 'pv' 'p7zip' 'wget')
makedepends=('vala')
source=("$pkgname-$pkgver.tgz::https://github.com/teejee2008/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9439d9f0601a799848c786435a51d276acd14d62dea91ab4d91f57994661ab73')

build() {
	cd "$pkgname-$pkgver"
	make all
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
