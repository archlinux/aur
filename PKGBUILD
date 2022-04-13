# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='sacc'
pkgver=1.06
pkgrel=1
pkgdesc='sacc(omys), simple console gopher client with TLS support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='gopher://bitreich.org/1/scm/sacc'
_url_source='ftp://bitreich.org/releases/sacc'
license=('ISC')
depends=('libretls' 'ncurses')
optdepends=('xclip')
source=("${_url_source}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('fb00a3b8e41041c35108c0af1042cdfede80a35376b03b43bdac4031db9b23d16d6f4384fae8c015a7e41931a2b23949c6b83c26089f0b3f92e3ccce21c379b8')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
