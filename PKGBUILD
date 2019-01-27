# Maintainer: Luca P <meti at lplab.net>

pkgname=hss
pkgver=1.8
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Interactive ssh client for multiple servers."
url="https://github.com/six-ddc/hss"
license=('GPL')
depends=(readline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/six-ddc/hss/archive/v$pkgver.tar.gz")
sha256sums=('60481274403c551f5b717599c813d619877a009832c4a8a84fcead18e39382fa')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make INSTALL_BIN="$pkgdir/usr/bin" install
}
