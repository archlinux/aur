# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.19
pkgrel=2
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
makedepends=('python-sphinx')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("https://fedorahosted.org/released/abrt/${pkgname}-${pkgver}.tar.xz")
sha256sums=('3bf57cf0f26b33f9d7a9bf374233af4ce93b9d65b2f4f671070eb24768fc738d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

