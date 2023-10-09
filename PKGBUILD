# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='sacc'
pkgver=1.07
pkgrel=1
pkgdesc='sacc(omys), simple console gopher client with TLS support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='gopher://bitreich.org/1/scm/sacc'
_url_source='ftp://bitreich.org/releases/sacc'
license=('ISC')
depends=('libretls' 'ncurses')
optdepends=('xclip')
source=("${_url_source}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('4ac2daa6d1d85bac420f75d0cb188b0b9aa6cd6799390b1924b14eec911bef20a2e8a296ca3ff905389ac80bf8e2ba7e080bf88e8c5ae06def4c53f8b912f6cc')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
