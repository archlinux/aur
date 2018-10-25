# Maintainer: Attenuation <ouyangjun1999@gmail.com>

pkgname=go-up
pkgver=0.1
pkgrel=1
pkgdesc="Ultimate Plumber is a tool for writing Linux pipes with instant live preview "
arch=('x86_64')
url="https://github.com/akavel/up"
license=('Apache License 2.0')
makedepends=('go')
source=("https://github.com/akavel/up/archive/v$pkgver.tar.gz")
sha256sums=('bad84abda77f8c101c401256484596ebc399f59c6114fc9a097ee061704a2e37')

build() {
  cd "up-$pkgver"

  go build
}

package() {
  cd "up-$pkgver"

  install -Dm755 up "$pkgdir/usr/bin/up"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}