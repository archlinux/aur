# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>

pkgname=swig
pkgver=2.0.1
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('gcc-libs' 'zlib')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('da5a1e396597be683a62d349d71802c33fb0f644')

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

# vim: set noexpandtab tabstop=8 shiftwidth=8 textwidth=132 autoindent
