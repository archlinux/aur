# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.6.1
pkgrel=1
pkgdesc='Mighty, modern CSS linter'
arch=('any')
url=https://stylelint.io
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=('stylelint-config-standard: for the standard shareable config')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('5f2bcac8d13b7b2aea92e67ce428ad77f52fde58c68ae6070ba522ced4d1eac592f6bcdaf23dd4790bff7867104bd359cff8a6882e0629d9351152f7c2cb79bf')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
