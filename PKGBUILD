# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=icmake
pkgver=8.00.05
pkgrel=1
pkgdesc='A program maintenance (make) utility using a C-like grammar'
arch=('i686' 'x86_64')
url='http://fbb-git.github.io/icmake/'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('24b8839a0c87ab411beb68867a8eabb592f5b861434af364519bf89eb7e26109')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_prepare /
	./icm_bootstrap /
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_install all "${pkgdir}"
}

