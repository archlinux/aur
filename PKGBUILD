# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.35
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus-m17n'
license=('GPL-2.0-or-later')
depends=('ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('9e9b90324d7933aab24442dbabf4762c9edde09d060f7d69de544077ae9666ab8e91551d0597ae79c730de94416def5f077c2cfd6d1423f0dfd8b32517b0c1b4')

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
