# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=bangin-server-node
pkgver=0.1.1
pkgrel=2
pkgdesc="A basic web server around bangin written in Node.js."
url="https://git.sr.ht/~samhh/${pkgname}"
license=("MIT")
arch=("any")
depends=("bangin" "nodejs")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("dd5255cfe3d9446deeed4b2b40b9f985cd84d0aca9ccd3987d67f6b724c5f692")

package() {
  cd "$pkgname-$pkgver"
  sed -i '1s:^:#!/usr/bin/env node\n\n:' ./index.js
  install -Dm755 ./index.js "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

