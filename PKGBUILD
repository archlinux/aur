# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-recommended
pkgver=4.0.0
pkgrel=1
pkgdesc='Recommended shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-recommended
license=('MIT')
makedepends=('git' 'npm')
source=("git+$url.git")
b2sums=('SKIP')

build() {
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
  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname CHANGELOG.md README.md
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
