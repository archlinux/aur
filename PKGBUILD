# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan <darjan_krijan@gmx.de>

pkgname=cubew
_version=4.7
_patch=
pkgver=${_version}${_patch}
pkgrel=1
pkgdesc="High-performance library for writing a multi-dimensional performance space."
arch=('i686' 'x86_64')
url="http://www.scalasca.org/software/cube-4.x/download.html"
license=('BSD')
depends=('zlib')
options=('staticlibs')
source=(http://apps.fz-juelich.de/scalasca/releases/cube/${_version}/dist/${pkgname}-${pkgver}.tar.gz)
md5sums=('a4468a84c7906d017f7d013b64f6849d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
