# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=icmake
pkgver=9.02.04
pkgrel=1
pkgdesc='A program maintenance (make) utility using a C-like grammar'
arch=('i686' 'x86_64')
url='http://fbb-git.github.io/icmake/'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('611ef06fb15b1f4ab3b258395020fc88ed555b4d8934fa66a1ec8fe863f049c8')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_prepare /
	./icm_bootstrap /
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_install all "${pkgdir}"
}

