# Maintainer: secureNqwer
pkgname=zerolink-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Zerolink relay server for peer discovery and message relay"
arch=("x86_64")
url="https://github.com/secureNqwer/zerolink-server"
license=("MIT")
depends=("glibc" "gcc-libs")
makedepends=("go" "git")
provides=("zerolink-server")
conflicts=("zerolink-server-bin")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
  cd "$srcdir/zerolink-server-$pkgver"
  go build -o zerolink-server ./cmd/server
}

package() {
  cd "$srcdir/zerolink-server-$pkgver"
  install -Dm755 zerolink-server "$pkgdir/usr/bin/zerolink-server"
}
