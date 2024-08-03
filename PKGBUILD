# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=3.1.1
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://codeberg.org/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('82717625b91f92ea4e7435798385762c6906835fa2cf2c80c9f83d6734bfddad')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
