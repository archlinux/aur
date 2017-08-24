# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: tantalum <tantalum at online dot de>
pkgname=g-wrap
pkgver=1.9.15
pkgrel=3
pkgdesc='A tool and guile library, for generating function wrappers for inter-language calls'
arch=(i686 x86_64)
license=(LGPL)
depends=('glib2' 'guile-lib>=0.2.2')
url='http://www.nongnu.org/g-wrap/'
source=("http://savannah.nongnu.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('037d465a28782636a995cf0179f1d7ff')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-Werror
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -f "${pkgdir}/usr/share/info/dir"
}
