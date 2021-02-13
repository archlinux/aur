# Maintainer: Lars Christensen <larsch@belunktum.dk>
# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=i2util
pkgver=4.3.3
pkgrel=1
pkgdesc="Internet2 utility tools"
arch=("x86_64")
url="https://software.internet2.edu/"
license=('Apache')
depends=("glibc")
source=("https://github.com/perfsonar/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aa48fef3604d657b3c5f71f828d68adfe324b4c57bc6aea397c7ecda34d22f04')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
