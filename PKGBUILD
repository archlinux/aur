# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='libtickit'
pkgver='0.2'
pkgrel='1'
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libtickit'
license=('MIT')
depends=('libtermkey' 'unibilium>=1.1.0')
makedepends=('')
conflicts=('libtickit-git')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5ba8581dfc17d0f56fc9e543aa452980ce864a5079a34d60db3a15b49c82c894ce082598865aeaa28c32c32549c40582fb40d1209ea893c8c6993604cae9437b')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
