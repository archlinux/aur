# Maintainer: Kyle Brooks <brookskd[at]gmail[dot]com>
# Co-Maintainer : bl4ckb0x <navkamal90[at]gmail[dot]com>

pkgname=systemc
pkgver=2.3.2
pkgrel=1
pkgdesc="Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems."
url="http://www.accellera.org/downloads/standards/systemc"
arch=('x86_64' 'i686')
license=('Apache License Version 2.0, January 2004')
depends=()
optdepends=()
makedepends=()
conflicts=('systemc')
provides=('systemc')
source=("http://accellera.org/images/downloads/standards/systemc/${pkgname}-${pkgver}.tar.gz")
md5sums=('3e9c8a8b0fb33198d04b45b642db557c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir objdir
  cd objdir
  ../configure --prefix=/usr --with-unix-layout=yes
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/objdir"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 # install -Dm644 docs/SystemC_Open_Source_License.pdf "$pkgdir/usr/share/licenses/$pkgname/SystemC_Open_Source_License.pdf"
}
