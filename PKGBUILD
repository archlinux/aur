# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=htmlhint
pkgver=0.14.0
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('bcfe6d59b150d86f23e363710daf4f925c73c69d06182df5fed65a727256618b328198f8cdbaf02c84f8bf3b1a7cdf3f96c57beeb0d39fedc26a2c69646381f3')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE.md usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
