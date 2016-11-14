# Maintainer: Ivan Koryabkin <apathism@apathism.net>

pkgname=libmongo-client
pkgver=0.1.8
pkgrel=1
pkgdesc="Alternative C driver for MongoDB (obsolete)"
arch=('i686' 'x86_64')
url="https://github.com/algernon/libmongo-client"
license=('Apache')
depends=('glib2')
source=("git+https://github.com/algernon/${pkgname}#tag=${pkgname}-${pkgver}")
sha512sums=('SKIP')


build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vi
	./configure --prefix=/usr
	make
}

package() {
	  cd "${srcdir}/${pkgname}"
	  make DESTDIR="${pkgdir}" install
	  install -D -m664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
