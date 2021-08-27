# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='twister'

pkgname="${_framework}-${_module}"
pkgver='0.8.2'
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
sha256sums=('065c3564029ac6e8e16be5676bb7b69c4ad8efd65c491acefaa22834b6a0f207'
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

