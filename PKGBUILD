# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'
_module='exchange'

pkgname="${_framework}-${_module}"
pkgver='0.9.4'
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
source=("ftp://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('717a9f0423e24e75127f9bd50eefe2a534cfed47cf0a54a3604ca35af4cff8ed'
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

