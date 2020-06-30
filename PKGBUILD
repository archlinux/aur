# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.30
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('gperf' 'json-c' 'libelf' 'python')
makedepends=('python-sphinx' 'rpm-org')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('86315b614fdd3445417df99c357f121dce82b22944ec8d61635e171c4dbb624d')

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

