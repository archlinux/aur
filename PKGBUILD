# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=htmlhint
pkgver=0.14.2
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('9540a019567fa320a4a600e421ae487c29705fc3e9cb5d4393b5dd7956e80064a62a322e38ac7acb2f3a592d16d3c285b4246ec5fb73372f8a7508cce148ea08')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE.md usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
