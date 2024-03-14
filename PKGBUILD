# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=3.1
pkgrel=2
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://codeberg.org/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('837b660c305215f0cbd68b002e831f29fe1a1d823cace74d75203111eb433bbd')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
