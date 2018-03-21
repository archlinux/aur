# Maintainer: duffydack <duffydack73 {at] gmail {dot} com>

pkgname=gifsicle-lossy
_pkgname=giflossy
pkgver=1.91
pkgrel=1
pkgdesc="Based on gifsicle which implements lossy LZW compression.  It can reduce animgif file sizes 30%—50% at a cost of some dithering/noise."
arch=('i686' 'x86_64')
url="https://github.com/kornelski/${_pkgname}"
license=('GPL2')
depends=('libx11')
makedepends=('autoconf' 'automake')
provides=('gifsicle')
conflicts=('gifsicle')
source=(https://github.com/kornelski/${_pkgname}/archive/${pkgver}.tar.gz)
sha1sums=('e80102f10f2ff79e8ce370cf176c9aa263e30c78')

build() {
  cd ${_pkgname}-${pkgver}
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
        cd ${srcdir}/${_pkgname}-${pkgver}
        make DESTDIR="${pkgdir}" install
}
