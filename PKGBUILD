# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=tang
pkgver=7
pkgrel=1
pkgdesc='Server for binding data to network presence'
arch=('x86_64')
url='https://github.com/latchset/tang'
license=('GPL3')
depends=('http-parser' 'jose')
makedepends=('asciidoc')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha512sums=('dd4187fa6962523ac2a745ef05a27cdf7e5264c595942e63d406d67a1c595e87bd7e74091cb2e16362f369480cdf8e3b4bfe1fee13b9cb73d5308f42c52f138a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --libexecdir=/usr/lib
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
