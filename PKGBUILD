# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.2.1
pkgrel=1
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('ab9c080c50aed75a8fb44469565baef84d76b8d978bb426c0d7fcae9189fd3b71da2f030be63ea59b6364d6a6064ca03c1bc055632ec8e4dc9b0e172c19ddac8')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@vtsls/language-server/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
