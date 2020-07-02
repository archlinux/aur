# Author: Javier Tiá <javier dot tia at gmail dot com>

pkgname=rgxg
pkgver=0.1.2
pkgrel=1
pkgdesc='ReGular eXpression Generator'
url='https://rgxg.github.io'
license=('zlib/libpng')
depends=('autogen')
makedepends=('autoconf' 'automake' 'gcc')
arch=('i686' 'x86_64')
_url="https://github.com/${pkgname}"
source=("${_url}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('554741f95dcc320459875c248e2cc347b99f809d9555c957d763d3d844e917c6')

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
