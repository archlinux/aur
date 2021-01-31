# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=stylelint-order
pkgver=4.1.0
pkgrel=1
pkgdesc='Plugin pack of order related linting rules for stylelint'
arch=('any')
url=https://github.com/hudochenkov/stylelint-order
license=('MIT')
depends=('nodejs' 'stylelint')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('74ddc718b93085ee15e9836617cc70fe7cd3b132cf845670127add287af1ff34')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  install -Dm644 \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
