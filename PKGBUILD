# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=owl-lisp
pkgver=0.1.13
pkgrel=1
pkgdesc='Simple purely functional lisp'
url='https://github.com/aoh/owl-lisp'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aoh/owl-lisp/archive/v${pkgver}.tar.gz)
sha512sums=('141543d8c5c8e3bca504fdeb533b2bc10e455f72bf24bb454c24d146a991f92b0b0777eef32cf12f9ddf50ee05a1ad143c80ea075f7f25946acb6eb61bc010c0')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 fasl/* -t "${pkgdir}/var/lib/${pkgname}/fasl"
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
