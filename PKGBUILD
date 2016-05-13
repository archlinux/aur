# Maintainer: Madotsuki <madotsuki@national.shitposting.agency>

pkgname=libtommath-git
pkgver=447f7b8
pkgrel=1
pkgdesc='A free open source portable number theoretic multiple-precision integer library written entirely in C'
url='http://www.libtom.org/LibTomMath/'
license=('custom')
arch=('i686' 'x86_64')
makedepends=('git')
source=("${pkgname}-${pkgver}::git+https://github.com/libtom/libtommath.git")
sha1sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
