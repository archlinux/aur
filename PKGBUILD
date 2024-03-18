# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint-config-recommended
pkgver=14.0.0
pkgrel=1
pkgdesc='Recommended shareable config for stylelint'
arch=('any')
url=https://github.com/stylelint/stylelint-config-recommended
license=('MIT')
depends=('stylelint')
makedepends=('git' 'npm')
source=("git+$url.git#tag=$pkgver")
b2sums=('0931167c401bf7df9657ecedd91d69cb8f1d660990bbb63b7e938332208bd0ea805bf505861c03667dd45c1b9ed3757df3c24cecdef619a7b829b918cd46f7cf')

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
