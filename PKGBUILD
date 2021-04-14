pkgname=upctl
pkgver=v0.5.0
pkgrel=1
pkgdesc="upctl - a CLI tool for managing UpCloud services."
arch=('x86_64')
url="https://upcloud.com"
license=('Apache')
makedepends=('go' 'git')
source=("https://github.com/UpCloudLtd/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make build
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 bin/upctl "$pkgdir/usr/local/bin/upctl"
}
