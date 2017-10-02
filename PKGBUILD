# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.23
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('libelf' 'python')
makedepends=('python-sphinx' 'rpm-org')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('7ff8b49f9dc9ccd65323c0689182a73eafb0f34262798ca06d23f38a0a22e7c2')

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

