# Maintainer: Arfad <arfadmuzali258@gmail.com>
pkgname=restui
pkgver=1.2.1
pkgrel=1
pkgdesc="Terminal UI API client for testing HTTP requests"
arch=('any')
url="https://github.com/arfadmuzali/restui"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
provides=('restui')
conflicts=('restui')

source=("$pkgname-$pkgver.tar.gz::https://github.com/arfadmuzali/restui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  export GO111MODULE=on
  export CGO_ENABLE=0
  go build -ldflags "-X main.version=v$pkgver" .

}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 restui "$pkgdir/usr/bin/restui"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

