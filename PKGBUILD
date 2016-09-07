# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=icmake
pkgver=9.01.00
pkgrel=1
pkgdesc='A program maintenance (make) utility using a C-like grammar'
arch=('i686' 'x86_64')
url='http://fbb-git.github.io/icmake/'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3d1e40c7cf4202f96b95387b770d9479911ae18aa6c43b0f45b5aa077ac60e54')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_prepare /
	./icm_bootstrap /
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_install all "${pkgdir}"
}

