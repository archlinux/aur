# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=htmlhint
pkgver=0.12.2
pkgrel=1
pkgdesc='Static Code Analysis Tool for your HTML'
arch=('any')
url=https://htmlhint.com/
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha512sums=('9b37cfa73e69387f8046d598d68aaeb6b58248166d0f8ecad6d7d3deead3b79e9d184808106b426f439b9c627b8c2856e11826b59bac49096e3003f1eceab77f')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr --ignore-scripts --production $pkgname-$pkgver.tgz

  cd "$pkgdir"
  mkdir -p usr/share/licenses/$pkgname
  mv usr/lib/node_modules/$pkgname/LICENSE.md usr/share/licenses/$pkgname
  chown -R root:root .
}

# vim:set ts=2 sw=2 et:
