# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libtickit
pkgver=0.3.2
pkgrel=2
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=(i686 x86_64)
url=http://www.leonerd.org.uk/code/libtickit
license=(custom:MIT)
depends=(libtermkey 'unibilium>=1.1.0')
conflicts=(libtickit-git)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('94d1da49783a4215617d129f07e2729282fabebf9555a70f565c59b26bf5ca5a1e0e7643ead3e25398238af2818edfe9bd56d41986ddf93b087ea1eeaea503a9')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
