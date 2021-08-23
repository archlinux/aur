# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgabe'
pkgver='1.0'
pkgrel=1
pkgdesc='Fork of libbswabe that replaces openssl with libgcrypt and fixes some bugs'
arch=('i686' 'x86_64')
url="https://github.com/schanzen/${pkgname}"
depends=('pbc')
license=('GPL2')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/schanzen/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a8c151a90c9ad8eaad073c8ad1482d66875e3433b0b4fd1e08424c0fc89e877')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix='/usr'
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	chmod 0644 "${pkgdir}/usr/lib/libgabe.a"
}

