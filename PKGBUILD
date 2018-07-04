# Maintainer: rawkode <david.andrew.mckay@gmail.com>

pkgname=click
pkgdir="pkg-build"
pkgdesc="Click CLI for Kubernetes"
pkgver=0.3.2
pkgrel=1
arch=('i686' 'x86_64' 'arm64')
url="https://github.com/databricks/click"
license=('apache2')
makedepends=('rust')

source=("https://github.com/databricks/click/archive/v${pkgver}.tar.gz")
sha256sums=('eed648409bf78a05658a9d097e5099ca17bf19df70122e2067859ae94c5575d5')

build() {
  cd "$srcdir/click-$pkgver"

  cargo build
}

package() {
  install -Dm 755 "$srcdir/click-$pkgver/target/debug/click" "$pkgdir/usr/bin/click"
}
