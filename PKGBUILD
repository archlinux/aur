# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname='libtickit'
pkgver='0.3'
pkgrel='1'
pkgdesc='Library for building interactive full-screen terminal programs.'
arch=('i686' 'x86_64')
url='http://www.leonerd.org.uk/code/libtickit'
license=('MIT')
depends=('libtermkey' 'unibilium>=1.1.0')
makedepends=('')
conflicts=('libtickit-git')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('dd44639863b0a2857fd69237d2b2912697ca896c2cb7b8fcf0e3bc66c8acdf9689130eb3cbe496cb325052434c4c31ca90e296d4cde77899adaf6e21a9e16477')

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
