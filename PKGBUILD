# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin-server-node
pkgver=0.1.0
pkgrel=1
pkgdesc="A basic web server around bangin written in Node.js."
url="https://github.com/samhh/${pkgname}"
license=("MIT")
arch=("any")
depends=("bangin" "nodejs")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("2518b4e1f635364cf129b0f2c278d1f4420c604350446f4c7cdbf2bce0087226")

package() {
  cd "$pkgname-$pkgver"
  sed -i '1s:^:#!/usr/bin/env node\n\n:' ./index.js
  install -Dm755 ./index.js "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

