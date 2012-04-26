# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=2.0.5
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('zlib' 'pcre')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('dfe3c89da775a0f98a8d884df1c658073c8a9087')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
