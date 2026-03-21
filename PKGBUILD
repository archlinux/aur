# Maintainer: Strahinya Radich <contact@strahinja.org>
pkgname=dtree
pkgver=0.3.2
pkgrel=1
pkgdesc="Command line program to draw trees"
arch=('x86_64')
url="https://strahinja.srht.site/dtree"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~strahinja/dtree/archive/v$pkgver.tar.gz")
md5sums=('b82b2c7e4f629efd5caa947f92c7bfca')

build() {
	cd "${pkgname}-v$pkgver"
	cp config.$(uname -s) config.mk
	
	make FALLBACKVER=${pkgver}-$pkgrel DESTDIR="$pkgdir" PREFIX="/usr" all
}

package() {
	cd "${pkgname}-v$pkgver"
	cp config.$(uname -s) config.mk

	make FALLBACKVER=${pkgver}-$pkgrel DESTDIR="$pkgdir" PREFIX="/usr" \
		install
}
