# Maintainer: Lars Christensen <larsch@belunktum.dk>
# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=owamp
pkgver=4.3.3
pkgrel=1
pkgdesc="A tool for performing one-way or two-way active network measurements."
arch=("x86_64")
url="http://software.internet2.edu/owamp/"
license=('Apache')
depends=("glibc" "libcap")
makedepends=("i2util")
source=("https://github.com/perfsonar/${pkgname}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('18b396749647c849b99013b15b27c0cb0e57ce369556cbb19987dfae4090be6f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf --force --install
  rm -rf I2util/
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
