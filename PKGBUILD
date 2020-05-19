# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.4.0
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
sha512sums=('54e00e9138a5e469947c4247f8ee8b76c820a14b7af764134aef987cb8553f9b054d5095a74f8f4b6a028e31bc65d5003fd68d34d6314cfe865956c1d6d9766e')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
