# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libtickit
pkgver=0.4.3
pkgrel=1
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=(i686 x86_64)
url=http://www.leonerd.org.uk/code/libtickit
license=(custom:MIT)
depends=(libtermkey 'unibilium>=1.1.0')
conflicts=(libtickit-git)
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('79472a71066e4ad7d59472c041b2fc9b75ba8936bc163b8ab12d158672c513bb6658d6e08a0bfe2f29c74cb4ed1827957b459a0d9713823ca73ce521f20f0e59')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
