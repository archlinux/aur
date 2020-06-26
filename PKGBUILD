# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=htmlhint
pkgver=0.14.1
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('5562ab96397017cb44287e3c60f7c2df4cd82a1aec32a9bbd1deef5ecc22bc4a9ddc34af6bc6652337de09add85851054482218972a02aeae5a84a42b5830200')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE.md usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
