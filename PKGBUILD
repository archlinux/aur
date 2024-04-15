# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.2.2
pkgrel=1
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('9404594a18776d672f405bac080d9a71502ca0f6c6b7f3e74d750a29c5ad837c28dc98729d196d1c48321814b419733ad4fbb20297b078bb48e2c91efd2d94c9')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@vtsls/language-server/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
