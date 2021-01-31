# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Lonfucius <Lonfucius@gmail.com>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=ibus-m17n
pkgver=1.4.4
pkgrel=1
pkgdesc='M17N engine for IBus'
arch=('x86_64')
url='https://github.com/ibus/ibus-m17n'
license=('LGPL')
depends=('ibus' 'm17n-db' 'm17n-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ibus/ibus-m17n/archive/${pkgver}.tar.gz")
sha512sums=('c46276bb6c5af8053a637b94eb0e4418b8061ce3515a5f2c380d166a799e12b90860fa8c6654e7136aefefb9594c7fb0618f1b052f8c7f5ae6bdd571f24f0053')

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
