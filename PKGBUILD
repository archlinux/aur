# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: vn158 <vn158 at seznam dot cz>
# Contributor: graysky

pkgname=mailsend
_rev=1b3cf9b85eed546e2eaf1dcb44d27b14c38e5a44
epoch=1
pkgver=1.19.r5.${_rev:0:10}
pkgrel=3
pkgdesc='A program to send mail via SMTP from command line.'
arch=('i686' 'x86_64')
url="https://github.com/muquit/${pkgname}"
license=('GPL')
depends=('openssl')
makedepends=('gcc' 'make' 'openssl')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/muquit/${pkgname}/archive/${_rev}.tar.gz")
sha256sums=('158dfd3cdbcefcc981d28cea11be865dd285e210413fdf439fb9ffac0b66b329')

build() {
	cd "${srcdir}/${pkgname}-${_rev}"

	./configure --with-openssl=/usr --prefix=${pkgdir}/usr
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${_rev}"

	make -j1 install
}

