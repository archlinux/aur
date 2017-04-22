# Maintainer: Jiří Prokop <jprokop@synaptiko.cz>

pkgname=seturgent
_pkgver=1.4
pkgver=1.4.0
pkgrel=1
pkgdesc="Set an applications urgency hint (or not)"
arch=('i686' 'x86_64')
url="https://github.com/synaptiko/seturgent"
license=('MIT')
depends=('libx11')
makedepends=('gcc' 'make')
provides=('seturgent')
source=('https://github.com/synaptiko/seturgent/archive/v1.4.tar.gz')
sha256sums=('af5fb239cd45f6305a82b9edd92025e960f91c75f05fb46458f7cd1b410368d2')

build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make seturgent
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	install -Dm755 seturgent "$pkgdir"/usr/bin/seturgent
}
