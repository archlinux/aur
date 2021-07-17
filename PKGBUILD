# Maintainer: Yuriy Chumak <yuriy.chumak at mail dot com>

pkgname='ol'
pkgver=2.2.1
pkgrel=1
pkgdesc='Otus Lisp, a purely functional dialect of Scheme'
arch=('i486' 'pentium4' 'i686' 'x86_64')
url='https://github.com/yuriy-chumak/ol'
license=('LGPL3' 'custom:MIT')
depends=('glibc')
makedepends=('vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuriy-chumak/ol/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd ${pkgname}-$pkgver
}

build() {
  cd ${pkgname}-$pkgver
  make
}

check() {
  cd ${pkgname}-$pkgver
  make tests rosettacode
}

package() {
  cd ${pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
