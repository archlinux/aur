# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libuev
pkgver=2.1.2
pkgrel=1
pkgdesc='Lightweight event loop library'
arch=('i686' 'x86_64')
url='https://github.com/troglobit/libuev'
depends=('pkgconfig')
makedepends=('gcc')
license=('custom')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5522eac0f8915fa9f4e2cb98d707aec58caa504643b152bb84d832cda2439ca9')

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
