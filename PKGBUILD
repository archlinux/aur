pkgname=ttyvideo
pkgver=0.0.1
pkgrel=2
pkgdesc="Play video in the terminal"
arch=('i686' 'x86_64')
license=('MIT')
depends=('opencv' 'gst-plugins-base')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jamesthoughton/${pkgname}/archive/${pkgver}.tar.gz")
url='https://github.com/jamesthoughton/ttyvideo'
sha256sums=('ecceca05dcfd94cadd0f17f58e3e98a93f5ee7ffe70a72e6935edf5e4a73fcc2')

build() {
	cd "${pkgname}-${pkgver}"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
