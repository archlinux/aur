# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='sacc'
pkgver=1.04
pkgrel=1
pkgdesc='sacc(omys), simple console gopher client with TLS support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='gopher://bitreich.org/1/scm/sacc'
_url_source='ftp://bitreich.org/releases/sacc'
license=('ISC')
depends=('libretls' 'ncurses')
source=("${_url_source}/${pkgname}-${pkgver}.tgz")
sha512sums=('d3ca4841e5c1d0cbaf16b92ba066d59abb2c4daa465943c69c917145d92f94b9d68ca2c25bc18ac8c04cf052e13e695d1d31f6b360a9c8fcbe2a6651e7e82e73')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
