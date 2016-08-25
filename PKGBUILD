# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former contributor: vn158 <vn158 at seznam dot cz>
# with support from: graysky

pkgname=mailsend
pkgver=1.19
pkgrel=2
pkgdesc='A program to send mail via SMTP from command line.'
arch=('i686' 'x86_64')
url="https://github.com/muquit/${pkgname}"
license=('GPL')
depends=('openssl')
makedepends=('gcc' 'make' 'openssl')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/muquit/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('565ef6be26c58ef75065c5519eae8dd55bae3142928619696b28d242b73493f7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --with-openssl=/usr --prefix=${pkgdir}/usr
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make -j1 install
}

