# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=rgxg
pkgver=0.1.1
pkgrel=1
pkgdesc='ReGular eXpression Generator'
url='https://rgxg.github.io'
license=('zlib/libpng')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
_url="https://github.com/${pkgname}"
source=("${_url}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6566cd05d116475e98ceb57a5fdb25d8743f7381799aeb8e218433ff4fbb139f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 ft=sh et:
