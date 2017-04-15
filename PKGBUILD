# Maintainer: David Phillips <dbphillipsnz gmail>

pkgname=farbfeld
pkgver=3
pkgrel=1
pkgdesc="conversion tools for the suckless image format"
url="http://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=()
provides=()
conflicts=(${pkgname}-git)
source=(http://dl.suckless.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
# Sums provided upstream: http://dl.suckless.org/farbfeld/sha1sums.txt
sha1sums=('d5ffa3d6941ae0672191f3a81dbf25c9c44f78d7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

