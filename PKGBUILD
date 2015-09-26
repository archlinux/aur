# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.20
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
makedepends=('python-sphinx')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("https://fedorahosted.org/released/abrt/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1257339d86ea5d7b96896c5fbe9b758c07f2fc37afc290c0dabbe49b93b55624')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

