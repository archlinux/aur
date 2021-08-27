# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='taler'

pkgname='sync'
pkgver='0.8.3'
pkgrel=1
pkgdesc='Backup and synchronization service'
arch=('i686' 'x86_64')
url="https://${_framework}.net/"
license=('AGPL')
groups=("${_framework}")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=('gnunet' 'taler-exchange' 'taler-merchant')
source=("http://ftp.gnu.org/gnu/${_framework}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('D8423BCB326C7907033929C7939E6BE1E29FC3CC')
sha256sums=('a61a11acc239c989d69d1112d7e71011d96d178629504e41e930aa93fc3d9c75'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

