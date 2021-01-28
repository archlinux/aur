# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libtickit
pkgver=0.4.1
pkgrel=1
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=(i686 x86_64)
url=http://www.leonerd.org.uk/code/libtickit
license=(custom:MIT)
depends=(libtermkey 'unibilium>=1.1.0')
conflicts=(libtickit-git)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1e78d1c3f3e6530d77c60aa38d10ffc541eb1b023b5eadd57b639e0d2840e07adadb83211e085b5f2b4bfa6ae41e487334321dd4776648bc4100c70d21b3075e')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
