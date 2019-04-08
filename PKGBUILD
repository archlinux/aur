# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libuev
pkgver=2.3.0
pkgrel=1
pkgdesc='Lightweight event loop library'
arch=('i686' 'x86_64')
url='https://github.com/troglobit/libuev'
depends=('pkgconfig')
makedepends=('gcc')
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7e62e96d8832a45e353c99bb67ae24a7e4d67a3b22ca2c10b288a94d104ac03a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
