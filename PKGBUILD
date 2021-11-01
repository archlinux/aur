# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='sacc'
pkgver=1.04
pkgrel=2
pkgdesc='sacc(omys), simple console gopher client with TLS support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='gopher://bitreich.org/1/scm/sacc'
_url_source='ftp://bitreich.org/releases/sacc'
license=('ISC')
depends=('libretls' 'ncurses')
source=("${_url_source}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('3bd48f8d633b80fe335d5c87005bda335d65201b8a2388bdae3c32e790b7d745be2b02cf3bf18083ba3f71e5aaafe86b00fea361c1041b58d4e25c8a052436c9')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
