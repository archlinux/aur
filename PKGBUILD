# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=autodock-vina
pkgver=1.2.2
pkgrel=1
arch=('i686' 'x86_64')
license=('Apache 2.0')
pkgdesc="A tool for drug discovery, molecular docking and virtual screening"
url="https://github.com/ccsb-scripps/AutoDock-Vina"
depends=('boost-libs')
makedepends=('boost')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v1.2.2.tar.gz)
sha256sums=('b9c28df478f90d64dbbb5f4a53972bddffffb017b7bb58581a1a0034fff1b400')

build() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  make
}

package() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  install -Dm755 vina "$pkgdir"/usr/bin/vina
  install -Dm755 vina_split "$pkgdir"/usr/bin/vina_split
}
