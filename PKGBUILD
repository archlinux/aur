# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=xsstest
pkgver=1337
pkgrel=42
pkgdesc="xss test"
url=""
arch=('any')
license=('MIT')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/anthraxx/cowfortune/archive/${pkgver}.tar.gz)
sha512sums=('42ab237ab571bc758e678fc66d1c4eb9694807e5886ee23056ccd738805a31c1de2c07c35466e4cc6c8cf4d7fcdd94289ddf207e5de374ccd60e37161d72469b')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
