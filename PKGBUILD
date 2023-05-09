# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=2.0
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://github.com/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3339e1ed2cfc71bcc459606d283a20a918f35c1ae9966c845c7d76faba93f120')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
