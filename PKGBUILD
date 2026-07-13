# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libtickit
pkgver=0.4.6
pkgrel=1
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=(i686 x86_64)
url=http://www.leonerd.org.uk/code/libtickit
license=(custom:MIT)
depends=(libtermkey 'unibilium>=1.1.0')
conflicts=(libtickit-git)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8162739b23beb109ef7de4a7aa18c1321e973f6139d4a88f4643f67a909865b1f52c8bd25a562f6cb353d0b6708b66b6ef9d61dfb86cd01eee3ac012333e0619')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
