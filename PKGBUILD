# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='twister'

pkgname="${_framework}-${_module}"
pkgver='0.9.3'
pkgrel=1
pkgdesc='Fault injector for HTTP traffic'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('curl' 'gnunet')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('bfb5a77e1d2e7db4cb3001a00f3833d50ea224605d8e79a1aeb26c21c36f86dd'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

#check() {
#	cd "${srcdir}/${pkgname}-${pkgver}"
#	make check
#}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

