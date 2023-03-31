# Maintainer:

pkgname=snarf
pkgver=7.0
pkgrel=9
pkgdesc="Command-line URL retrieval tool (http/ftp/gopher)"
arch=('x86_64')
url="https://www.xach.com/snarf/"
license=('GPL')
depends=('glibc')
source=(https://www.xach.com/snarf/download/source/${pkgname}-${pkgver}.tar.gz)
sha256sums=('85a0846d452b02eaff225bf68fb36e68dfc55be5a58fda38dcb3602dcc300a89')

build() {
  cd ${pkgname}-${pkgver}
  export CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
