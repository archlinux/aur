# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=1.1
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://github.com/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c4b5dbc20f39800bd774afb6b5d709ce90fe4482a44ea19ff24a2e27466729c8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
