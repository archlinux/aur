# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
pkgname=hurl
pkgver=0.7
pkgrel=1
pkgdesc='HTTP/HTTPS/Gopher file grabber'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/hurl.html'
_url_source='https://codemadness.org/releases/hurl'
license=('ISC')
depends=('libretls')
conflicts=('hurl-bin')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ece366446e24ae97eed6f53405698ee7490f909b153f7a55679c8cea950c55ab')

build() {
	make -C "${pkgname}-${pkgver}"
}

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' MANDIR='/usr/share/man' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
