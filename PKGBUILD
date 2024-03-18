# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-standard
pkgver=36.0.0
pkgrel=1
pkgdesc='Standard shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-standard
license=('MIT')
depends=('stylelint' 'stylelint-config-recommended')
makedepends=('git' 'npm')
source=("git+$url.git#tag=$pkgver")
b2sums=('d1002f1e2ee514188b716686ce785a9b15b59a5956c16b34ee1606ff381db19278458bf844acad328d3b7b4627d8ffee12f2d3fb9b9357a1014c1cd3d33b1e40')

prepare() {
  cd $pkgname
  npm ci
}

check() {
  cd $pkgname
  npm test
}

package() {
  cd $pkgname
  install -Dm644 -t "$pkgdir"/usr/lib/node_modules/$pkgname index.js
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
