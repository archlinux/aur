# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.23
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus-m17n'
license=('LGPL')
depends=('ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('b67ecac6d453a1fff9e6cdaca9351b6135893bf5c2cc18d1f47894601a72cd4d2180bc4e5819769a583bc09f76929d567616ce6ffed4c6e965b35a88db630c71')

prepare() {
  cd $pkgname-$pkgver

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver

  ./configure  \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
