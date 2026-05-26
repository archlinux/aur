# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=vicinae-kotoba
pkgver=2026.05.25
pkgrel=1
pkgdesc="Japanese dictionary, translator, and Anki integration for Vicinae — search Jotoba, translate sentences, add cards to Anki"
arch=('any')
url="https://github.com/kurojs/Kotoba"
license=('MIT')
depends=('vicinae-bin' 'nodejs' 'npm')
makedepends=('git' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kurojs/Kotoba/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/vicinae/extensions/kotoba"
  install -Dm644 dist/kotoba.js "$pkgdir/usr/share/vicinae/extensions/kotoba/kotoba.js"
  install -Dm644 package.json "$pkgdir/usr/share/vicinae/extensions/kotoba/package.json"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/vicinae/extensions/kotoba/icon.png"
}
