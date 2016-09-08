# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.21
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('libelf' 'python')
makedepends=('python-sphinx')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("https://fedorahosted.org/released/abrt/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9be4244d8d80de5e384cb4b2802f9b68921d65bc4ef14bc05b98e9cd06493b5c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}/" install
}

