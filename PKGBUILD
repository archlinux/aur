# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-standard
pkgver=24.0.0
pkgrel=1
pkgdesc='Standard shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-standard
license=('MIT')
depends=('stylelint' 'stylelint-config-recommended')
makedepends=('git' 'npm')
source=("git+$url.git")
b2sums=('SKIP')

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

# vim:set ts=2 sw=2 et:
