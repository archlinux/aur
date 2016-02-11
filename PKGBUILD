pkgname=tcptrack
pkgver=1.4.3
pkgrel=1
pkgdesc="A sniffer which displays information about TCP connections it sees on a network interface"
arch=('i686' "x86_64")
url="https://github.com/bchretien/tcptrack/"
license=('GPL')
depends=('libpcap')
source=("https://github.com/bchretien/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8725205ecbeddc3f891e3345e70f150d87705b099eafd8780f4739ab14f8c862')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
