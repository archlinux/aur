pkgname=microcom
pkgver=2025.11.0
pkgrel=1
pkgdesc="terminal emulator"
arch=('x86_64')
license=('GPL2')
url='https://github.com/pengutronix/microcom'
depends=('readline')
source=("https://github.com/pengutronix/microcom/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b1d734a249d8613db7ca1f1bb2ec4e28a35234a60212d91e0c00cc22e9c67a39')

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
