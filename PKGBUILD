# Maintainer: Armin K. <krejzi at email dot com>

pkgname=libgxim
pkgver=0.5.0
pkgrel=3
pkgdesc="GObject-based XIM protocol library"
arch=('i686' 'x86_64')
url="http://tagoh.bitbucket.org/libgxim/"
license=('LGPL2')
depends=('gtk2')
makedepends=('check' 'ruby' 'intltool')
source=("https://bitbucket.org/tagoh/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('75e20d1744139644f9951b78ea3910b162d3380302315cb4b3d0640f23694c79')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
