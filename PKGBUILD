# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=satyr
pkgver=0.42
pkgrel=1
pkgdesc='Automatic problem management with anonymous reports'
arch=('i686' 'x86_64')
depends=('gperf' 'json-c' 'libelf' 'python' 'rpm-tools')
makedepends=('python-sphinx')
url='https://github.com/abrt/satyr'
license=('GPL')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/abrt/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('b3a550736835caa9beb94c39b0e8c18341915ca6a2c04c9a96e2fde6a331ec7d')

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

