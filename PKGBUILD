# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='exchange'

pkgname="${_framework}-${_module}"
pkgver='0.8.5'
pkgrel=1
pkgdesc='Exchange implementation'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('python' 'gnunet' 'libmicrohttpd' 'postgresql')
makedepends=('python-jinja')
#checkdepends=('wget')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('8de8502a40d87439045de9ff2d29f48198b8b58a7291833dd96df965b48b363e'
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

