# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='exchange'

pkgname="${_framework}-${_module}"
pkgver='0.9.3'
pkgrel=1
pkgdesc='Exchange implementation'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('python' 'gnunet' 'libmicrohttpd' 'postgresql' 'jq')
makedepends=('python-jinja')
#checkdepends=('wget')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('935aa32a1471e6f2ae43f106c71b2928d835891d41c9e5058a9457466f6517a2'
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

