# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='texi2mdoc'
pkgver='0.1.2'
pkgrel=1
pkgdesc='Convert Texinfo data to mdoc input'
arch=('i686' 'x86_64')
url='https://mandoc.bsd.lv/texi2mdoc/'
license=('ISC')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://mandoc.bsd.lv/${pkgname}/snapshots/${pkgname}-${pkgver}.tgz")
sha256sums=('7a45fd87c27cc8970a18db9ddddb2f09f18b8dd5152bf0ca377c3a5e7d304bfe')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr all
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}

