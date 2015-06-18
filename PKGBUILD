# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Changaco <changaco ατ changaco δοτ net>

pkgname=slowhttptest
pkgver=1.6
pkgrel=1
pkgdesc="An highly configurable tool that simulates some Application Layer Denial of Service (DoS) attacks"
url="http://code.google.com/p/slowhttptest/"
arch=('x86_64' 'i686')
license=('Apache')
depends=('openssl')
source=("http://slowhttptest.googlecode.com/files/slowhttptest-${pkgver}.tar.gz")
sha256sums=('77c54a64cfa5f12a84729833d9b98d5f27f828f51a5e42ad5914482d0b2bd0d6')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et:
