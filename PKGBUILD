# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Tobias Kieslich [tobias.justdreams.de]

pkgname=libxmi
pkgver=1.2
pkgrel=9
pkgdesc="A library for rasterizing 2-D vector graphics"
arch=('x86_64')
url="https://www.gnu.org/software/libxmi/libxmi.html"
license=('GPL')
depends=('glibc')
source=(http://mirrors.usc.edu/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('4e6935484f0ad71b531920bf4c546b47')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf --force --install
  ./configure --prefix=/usr --infodir=/usr/share/info
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
