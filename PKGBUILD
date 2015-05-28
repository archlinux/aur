# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=openspecfun
pkgver=0.4
pkgrel=2
pkgdesc="A collection of special mathematical functions"
arch=('i686' 'x86_64')
url="https://github.com/JuliaLang/openspecfun"
license=('custom:Faddeeva' 'custom:Amos')
depends=('gcc-libs')
makedepends=('gcc-fortran')
options=('!emptydirs')
source=("https://github.com/JuliaLang/openspecfun/archive/v${pkgver}.tar.gz")
md5sums=('9b5c189dc2011a8197d0c1f710c33fe5')


build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make prefix=/usr bindir=/usr/bin libdir=/usr/lib includedir=/usr/include
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" prefix=/usr bindir=/usr/bin libdir=/usr/lib includedir=/usr/include install
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
