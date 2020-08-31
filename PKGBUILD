# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.7.0
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
sha512sums=('d704ad778cd57ad9e51cef7c56370741b8d20e6bdc037f6c9a465031cb7671ffa1a26e341f4c6540d773cdbb30a06fe318187ad7f51ef66ecbbbdf4f639d4ee8')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
