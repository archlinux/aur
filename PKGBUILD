# Maintainer: Timofei Zhakov <tima at chemodax dot net>

pkgname=xdigest
pkgver=0.1.0
pkgrel=1
pkgdesc='Extremely fast digest algorithms packaged into a lightweight library.'
arch=('x86_64')
url='https://github.com/rinrab/xdigest'
license=('Apache 2.0')
makedepends=('git' 'make' 'ninja')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rinrab/xdigest/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('20663922437a53451ffe85c61775ec4c9c471a857b3059a71b8eb0db72b6eba0')

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
