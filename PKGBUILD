# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>
pkgname=hurl
pkgver=0.8
pkgrel=1
pkgdesc='HTTP/HTTPS/Gopher file grabber'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://codemadness.org/hurl.html'
_url_source='https://codemadness.org/releases/hurl'
license=('ISC')
depends=('libretls')
conflicts=('hurl-bin')
source=("${_url_source}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('00facf1f6aa507af8544f50ad6722d1f13724b3553dba2aed1ab86c4d76b42c1')

build() {
	make -C "${pkgname}-${pkgver}"
}

package() {
	make DESTDIR="${pkgdir}" PREFIX='/usr' MANDIR='/usr/share/man' -C "${pkgname}-${pkgver}" install
	install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
