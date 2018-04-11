# Maintainer: David Phillips <dbphillipsnz gmail>

pkgname=farbfeld
pkgver=4
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
sha1sums=('7ba0ea0a92e9c378a777cb2152efc8ef6def86c2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

