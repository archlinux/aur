# Maintainer: David Phillips <dbphillipsnz gmail>

pkgname=farbfeld
pkgver=1
pkgrel=1
pkgdesc="conversion tools for the suckless image format"
url="http://tools.suckless.org/farbfeld/"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libjpeg-turbo' 'libpng')
makedepends=()
provides=()
conflicts=(${pkgname}-git)
epoch=1
source=(http://git.suckless.org/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.bz2)
sha512sums=('9f39a1503b6e531b0f2dafa40c56fb3e7906cbca988319aac8435b1dc48ca7f1dbcf4e1c3386ac76b0fed6b5100e453aa42c16e69bd71e1d70f58cee4a9cab41')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

