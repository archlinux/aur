# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Hilton Medeiros <medeiros.hilton at gmail dot com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig2
_pkgname=swig
pkgver=2.0.12
pkgrel=5
pkgdesc='A compiler that integrates C and C++ code with scripting languages (2.0.x version)'
arch=('i686' 'x86_64')
url='http://www.swig.org/'
license=('custom')
depends=('zlib')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	./configure --prefix=/usr --program-suffix="-2"
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
