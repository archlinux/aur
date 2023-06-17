# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=3.0
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://github.com/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4393d3990189e9c2831f5a192b4333eb0f526eec5babacc7aafc3dcb02aaa25b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
