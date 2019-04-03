# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Camille Moncelier <pix@devlife.org>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-m17n
pkgver=0.2.3
pkgrel=7
pkgdesc='Multilingual input method module for SCIM'
url='https://github.com/scim-im/scim-m17n'
license=('GPL')
arch=('x86_64')
depends=('scim' 'm17n-lib')
source=("https://downloads.sourceforge.net/sourceforge/scim/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c54be4c8c331d5621dcfa6c0c6f302231071dbbaf3ef7aee4117fe2c2616d58e184d3bae720dce27d5cb6567064add6979630090c72f9350391ca9c3e9c404f3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
