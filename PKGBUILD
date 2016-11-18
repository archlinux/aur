# Maintainer: Jan Koppe <post@jankoppe.de>

pkgname=yarn
pkgver=0.17.4
pkgrel=1
pkgdesc='Fast, reliable, and secure dependency management.'
arch=(any)
url='http://yarnpkg.com'
license=('BSD')
depends=('nodejs')
source=("https://github.com/yarnpkg/yarn/releases/download/v$pkgver/yarn-v$pkgver.tar.gz")
sha256sums=('1bcd0371f6b35ae70be663beffc34a6d63c85ab23bf338e34c489b32e369fa9a')

package() {
  install -dm755  "$pkgdir"/usr/lib/node_modules/yarn
  cp -R "$srcdir"/dist/* "$pkgdir"/usr/lib/node_modules/yarn

  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/node_modules/yarn/bin/yarn.js "$pkgdir"/usr/bin/yarn

  install -Dm644 "$srcdir"/dist/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
