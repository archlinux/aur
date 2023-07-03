# Maintainer: Matthias Volk <m.volk at utwente dot nl>
pkgname=carl-storm
pkgver=14.25
pkgrel=1
pkgdesc="The Computer ARithmetic and Logic library for the probabilistic model checker Storm"
arch=(i686 x86_64)
url="https://github.com/moves-rwth/carl-storm"
license=('MIT')
depends=(boost cln eigen ginac gmp)
makedepends=(cmake)
optdepends=()
provides=()
conflicts=(carl)
replaces=(carl-master14)
source=("$pkgname-$pkgver.tar.gz::https://github.com/moves-rwth/carl-storm/archive/$pkgver.tar.gz")
sha256sums=(511740d53c2a6a41c3ccb3bd3b2d9ec89d0576f37b8804fc15fbe083e7a357da)

build() {
    mkdir -p "$pkgname-$pkgver/build"
	cd "$pkgname-$pkgver/build"
    cmake -DEXCLUDE_TESTS_FROM_ALL=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
