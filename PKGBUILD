pkgname=systemc-ams
pkgver=2.1
pkgrel=1
pkgdesc="SystemC-AMS is an Analog and Mixed-Signal extension library for SystemC"
url="http://www.accellera.org/activities/working-groups/systemc-ams"
arch=('x86_64' 'i686')
license=('custom:SystemC-AMS Open Source License')
depends=('systemc')
optdepends=()
makedepends=()
conflicts=('')
provides=('systemc-ams')
source=("http://www.coseda-tech.com/files/coside/user_files/Files/Proof-of-Concepts/systemc-ams-2.1.tar.gz")
md5sums=('ae88cb42dc5216e3c8e3e36dd1fc2f7c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=${pkgdir}/usr --with-layout=unix
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install
}
