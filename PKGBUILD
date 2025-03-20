# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=3.1.2
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://codeberg.org/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d06c63d88ffdc681132eec74095d1ed9cc0cfcc3532f59b93ceea0eecf325f35')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
