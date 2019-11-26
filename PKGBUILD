# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libtickit
pkgver=0.3.3
pkgrel=1
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=(i686 x86_64)
url=http://www.leonerd.org.uk/code/libtickit
license=(custom:MIT)
depends=(libtermkey 'unibilium>=1.1.0')
conflicts=(libtickit-git)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8b89bcb63b7bea8f52a684e050d7ef48f6ff45216501adb007320e60a271efa5f3bb9b8e424058686ae9b991dcb9a6668c5493ded2b66838343cd7264ac831c2')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
