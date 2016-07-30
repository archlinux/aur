# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=owl-lisp
pkgver=0.1.12
pkgrel=1
pkgdesc='Simple purely functional lisp'
url='https://github.com/aoh/owl-lisp'
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/aoh/owl-lisp/archive/v${pkgver}.tar.gz)
sha512sums=('8663dbc4b5e60d2e1e63d810d128b3000a23c9afdf8ecd8d7daf021cc48176ac03aced6420d23744f930d64ea0b19a512690d23d80052ccb6389630a25f42400')

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
