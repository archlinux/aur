# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Former contributor: vn158 <vn158 at seznam dot cz>
# with support from: graysky

pkgname=mailsend
_fullrev=353bf37026cace4541982403732991bce40cfd35
_rev=353bf37026
pkgver=1.19.${_rev}
pkgrel=3
pkgdesc='A program to send mail via SMTP from command line.'
arch=('i686' 'x86_64')
url="https://github.com/muquit/${pkgname}"
license=('GPL')
depends=('openssl')
makedepends=('gcc' 'make' 'openssl')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/muquit/${pkgname}/archive/${_fullrev}.tar.gz")
sha256sums=('48db712653c11d02c506e3210715694d053855a9df42f4badc1780ed83b8c032')

build() {
	cd "${srcdir}/${pkgname}-${_fullrev}"

	./configure --with-openssl=/usr --prefix=${pkgdir}/usr
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-${_fullrev}"

	make -j1 install
}

