# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.18
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus-m17n'
license=('LGPL')
depends=('ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('81589fca2c982be99a046473498123155ec0158c6bea0118ce53cd7451d7d82d4d3b5b2a49755653cc7f86780539153c4ac675adf8d540ffa2969c52bc7451aa')

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
