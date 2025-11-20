# Maintainer: JoelSGC <contact@joelsgc.dev>
pkgname=netpala
pkgver=1.0.0
pkgrel=1
pkgdesc="Golang based Wi-Fi manager inspired by Impala"
arch=('x86_64')
url="https://github.com/joel-sgc/netpala"
license=('WTFPL')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  go build -buildmode=pie -ldflags "-linkmode external -extldflags '-Wl,-z,now'" -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
