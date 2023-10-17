# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.1.22
pkgrel=1
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('03aed513a276523c8f92e86d78ef4f023f03c46067f66abb5365f50f510eb9eee363b1984443698a3a9204c17c25a6ae4c707b8bfb30fc987e728ae6a5ed0cee')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@vtsls/language-server/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
