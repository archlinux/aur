pkgname=systemc-ams
pkgver=2.1
pkgrel=2
pkgdesc="SystemC-AMS is an Analog and Mixed-Signal extension library for SystemC"
url="http://www.accellera.org/activities/working-groups/systemc-ams"
arch=('x86_64' 'i686')
license=('Apache License Version 2.0, January 2004')
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  for file in NOTICE AUTHORS README NEWS RELEASENOTES; do
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" $file
  done
}
