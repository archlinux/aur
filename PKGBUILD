# Maintainer: Attenuation <ouyangjun1999@gmail.com>

pkgname=go-up
pkgver=0.2.1
pkgrel=1
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview "
arch=('x86_64')
url="https://github.com/akavel/up"
license=('Apache License 2.0')
makedepends=('go')
source=("https://github.com/akavel/up/archive/v$pkgver.tar.gz")
sha256sums=('69b096780e27805c5da904dfbb3ca10ff8260745b1411b3d61784ee72de33b2c')

build() {
  cd "up-$pkgver"

  go build
}

package() {
  cd "up-$pkgver"

  install -Dm755 up "$pkgdir/usr/bin/up"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}