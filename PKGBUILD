# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>

pkgname=icmake
pkgver=9.02.07
pkgrel=1
pkgdesc='A program maintenance (make) utility using a C-like grammar'
arch=('i686' 'x86_64')
url='http://fbb-git.github.io/icmake/'
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fbb-git/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fa05f0c74fb6442ddd35ad354877e185aa95bb7e0431035a79a02cdf1328260e')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_prepare /
	./icm_bootstrap /
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/${pkgname}"

	./icm_install all "${pkgdir}"
}

