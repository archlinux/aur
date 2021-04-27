# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Javier Tiá <javier dot tia at gmail dot com>

pkgname=libuev
pkgver=2.3.2
pkgrel=1
pkgdesc='Lightweight event loop library'
arch=('i686' 'x86_64')
url='https://github.com/troglobit/libuev'
depends=('pkgconf')
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('af31ffe1058a2ff6c56fee26ec8749688704d297189b6a898380a601efefbec9')

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
