# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=autodock-vina
pkgver=1.2.6
pkgrel=1
arch=('i686' 'x86_64')
license=('Apache-2.0')
pkgdesc="A tool for drug discovery, molecular docking and virtual screening"
url="https://github.com/ccsb-scripps/AutoDock-Vina"
depends=('boost-libs')
makedepends=('boost')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9a3b888feaab511e3188b012bde1d41be0d72b54aa9516465b383f31dc394743')

build() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  make
}

package() {
  cd "$srcdir"/AutoDock-Vina-$pkgver/build/linux/release
  install -Dm755 vina "$pkgdir"/usr/bin/vina
  install -Dm755 vina_split "$pkgdir"/usr/bin/vina_split
}
