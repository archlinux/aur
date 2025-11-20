# Maintainer: JoelSGC <contact@joelsgc.dev>
pkgname=bluepala
pkgver=0.7.5
pkgrel=1
pkgdesc="Golang based BlueZ manager inspired by Impala"
arch=('x86_64')
url="https://github.com/joel-sgc/bluepala"
license=('WTFPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  go build -buildmode=pie -ldflags "-linkmode external -extldflags '-Wl,-z,now'" -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
