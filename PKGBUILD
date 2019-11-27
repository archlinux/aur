# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=libmag3110
pkgver=0.1.7
pkgrel=1
epoch=
pkgdesc="A C++ library for the MAG3110 SparkFun 3-axis magnetometer breakout board" 
arch=('aarch64' 'armv6h' 'armv7h')
url="https://ahpohl.github.io/mag3110/"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/mag3110.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/doc/$pkgname/LICENSE
  install -Dm644 include/mag3110.hpp "$pkgdir"/usr/include/mag3110
}
