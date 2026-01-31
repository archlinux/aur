# Maintainer: Timofei Zhakov <tima at chemodax dot net>

pkgname=xdigest
pkgver=0.2.1
pkgrel=1
pkgdesc='Extremely fast digest algorithm implementations packaged into a lightweight library. '
arch=('x86_64')
url='https://github.com/rinrab/xdigest'
license=('Apache 2.0')
makedepends=('git' 'make' 'ninja')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rinrab/xdigest/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('57e7d77c3e53ff45a34190ba8282500b9fdec3808a20c0ec28459049523911de')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make test
}

package() {
  cd $pkgname-$pkgver
  make install prefix=${pkgdir}/usr
}

# vim:set ts=2 sw=2 et:
