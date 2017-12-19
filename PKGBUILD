# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libuev
pkgver=2.1.0
pkgrel=1
pkgdesc='Lightweight event loop library'
arch=('i686' 'x86_64')
url='https://github.com/troglobit/libuev'
depends=('pkgconfig')
makedepends=('gcc')
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a59044bd59292cdd0bd626df5f8215b6819dd2358420c22cd694a29d8bcdcd56')

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

# vim:set ft=sh ts=2 sw=2 et:
