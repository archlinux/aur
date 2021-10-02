pkgname=microcom
pkgver=2019.01.0
pkgrel=1
pkgdesc="terminal emulator"
arch=('x86_64')
license=('GPL')
url='https://github.com/pengutronix/microcom'
depends=('readline')
source=("https://github.com/pengutronix/microcom/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f455a53f20c089428cdf4f6e84556f6b0d4b84d8793829ac073ef5b82c1b122f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
