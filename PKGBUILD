# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.11
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus-m17n'
license=('LGPL')
depends=('ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('5a03b474ffe440d42b347ebc71148b8def04e32f842ace286a55908fe1d211bedcb4957b153feec24ef0df0c9da7a883f5e1bf71f3de8e9056cf589be2a1d6b6')

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
