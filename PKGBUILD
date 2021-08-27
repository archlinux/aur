# Maintainer: grufo <madmurphy333@gmail.com>

_framework='taler'
_module='exchange'

pkgname="${_framework}-${_module}"
pkgver='0.8.4'
pkgrel=1
pkgdesc='Exchange implementation'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('gnunet' 'libmicrohttpd' 'postgresql')
makedepends=('python-jinja')
# checkdepends=('wget')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('9184e60e38ba5ded1b129bb208530ae4a30dd749d7f07d23b635c8dcb06c4a5c'
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

