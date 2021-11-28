# Maintainer: Anders Damsgaard <anders@adamsgaard.dk>

pkgname='sacc'
pkgver=1.05
pkgrel=1
pkgdesc='sacc(omys), simple console gopher client with TLS support'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='gopher://bitreich.org/1/scm/sacc'
_url_source='ftp://bitreich.org/releases/sacc'
license=('ISC')
depends=('libretls' 'ncurses')
optdepends=('xclip')
source=("${_url_source}/${pkgname}-${pkgver}.tar.lz")
sha512sums=('ea189ffb7ec7c360b074fb4d1e78cd1b2d5c6f28fb491b5e6790081f55979a4b2220198002ad1db7cbc59ccf06639e0f74d836df4cb81e02a721225a778fa337')

build() {
  make -C "${pkgname}-${pkgver}"
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "${pkgname}-${pkgver}" install
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
