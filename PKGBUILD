# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=swig
pkgver=2.0.0
pkgrel=1
pkgdesc="A compiler that makes it easy to integrate C and C++ code with scripting languages"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('gcc-libs' 'zlib')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('36ee2d9974be46a9f0a36460af928eb9')
sha1sums=('60faa84a326e5aa8a94f290e9debed4551c1b1e7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES"
}
