# Maintainer: Zola Gonano <zolagonano@protonmail.com>

pkgname=torbridge-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="Command-line interface tool to fetch Tor bridges from BridgeDB"
arch=('x86_64')
url="https://github.com/zolagonano/torbridge-cli"
license=('MIT')
depends=('rust')
makedepends=('git' 'base-devel')

source=("git+https://github.com/zolagonano/torbridge-cli.git#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cd "$srcdir/torbridge-cli"

  cargo build --release
}

package() {
  cd "$srcdir/torbridge-cli"
  
  strip "target/release/torbridge-cli"
  install -Dm755 "target/release/torbridge-cli" "$pkgdir/usr/bin/torbridge-cli"
}

