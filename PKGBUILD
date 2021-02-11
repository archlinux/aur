# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=stylelint
pkgver=13.10.0
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
b2sums=('6cc6fb1619b3c591bdcc95240959bbe536bc5f050cac5301cf08a2a1cc831c92a6c55c5e053a034ae603a3a43b593b01d0d37a93ada0cb7c13a86b58395c1166')

package() {
  npm install --global \
              --user root \
              --prefix "$pkgdir"/usr \
              --production \
              $pkgname-$pkgver.tgz
  chown -R root:root "$pkgdir"
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/lib/node_modules/$pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
