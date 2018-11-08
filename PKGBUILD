# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.27
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('libelf' 'python')
makedepends=('python-sphinx' 'rpm-org')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8a2b2d63d0733ebf799604580c7aee9a54818847feedecf150a55f12d80f1819')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

