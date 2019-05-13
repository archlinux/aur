# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=click
pkgdir="pkg-build"
pkgdesc="Click CLI for Kubernetes"
pkgver=0.4.0
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/databricks/click"
license=('apache2')
makedepends=('rust')

source=("https://github.com/databricks/click/archive/v${pkgver}.tar.gz")
sha256sums=('69df76f57af8b0c244ef4c975a242d3fe84f8e4f4fd44e62b2ccdf24ea82b23d')

build() {
  cd "$srcdir/click-$pkgver"

  cargo build
}

package() {
  install -Dm 755 "$srcdir/click-$pkgver/target/debug/click" "$pkgdir/usr/bin/click"
}
