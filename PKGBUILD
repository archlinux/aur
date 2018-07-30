# Maintainer: Luca P <meti at lplab.net>

pkgname=hss
pkgver=1.7
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="Interactive ssh client for multiple servers."
url="https://github.com/six-ddc/hss"
license=('GPL')
depends=(readline)
source=("$pkgname-$pkgver.tar.gz::https://github.com/six-ddc/hss/archive/v$pkgver.tar.gz")
sha256sums=('99371c15fde236c806f7b6ed21b12bafc4f559fcbb636e0ab2112b09faa0e44a')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make INSTALL_BIN="$pkgdir/usr/bin" install
}
