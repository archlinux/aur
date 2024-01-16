# Maintainer: tarball <bootctl@gmail.com>

pkgname=vtsls
pkgver=0.1.24
pkgrel=1
pkgdesc='LSP wrapper for the TypeScript extension from Visual Studio Code'
url='https://github.com/yioneko/vtsls'
license=(MIT)
arch=(any)
depends=(nodejs)
makedepends=(npm)
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@vtsls/language-server/-/language-server-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
b2sums=('9deb83ebb38764860c345b2bbfd692d74af9947679b7a6164814e5f479eb6612ffaadd5b99f8f7b8ba99e8c7ddf973bf2a4745d32aa708c9a498b3563d9eee50')

package() {
  npm install --global \
    --cache "$srcdir/npm-cache" \
    --prefix "$pkgdir/usr" \
    "$srcdir/$pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/@vtsls/language-server/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
