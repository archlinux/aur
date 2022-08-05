# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ivan Smolyakov <smol.ivan97@gmail.com>

pkgname=mcron
pkgver=1.2.1
pkgrel=2
pkgdesc="Pure Guile, compatible replacement for cron"
url="https://gnu.org/software/mcron/"
arch=('x86_64')
license=('GPL3')
depends=('guile')
provides=('cron')
conflicts=('cron')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/mcron/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/mcron/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('20fe726c8c53e00261a3a8e191051228b07558292de5abe3714445f1ca10762e'
            'SKIP')
validpgpkeys=('961AB15C62EF3B92DAB5965988C3D2BEA81462EB') ## Adam Bilbrough

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}
