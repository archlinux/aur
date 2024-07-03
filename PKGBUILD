# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.2.5
pkgrel=1
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('927ab7a625c717de37b61b52697722245d8e7d2b4729d540374598ca4a4149d2f8a870e4213d8d80c5a5e45a3fa2d94c2104708db001da9f2ccdd20d1d32ff99')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@vtsls/language-server/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
