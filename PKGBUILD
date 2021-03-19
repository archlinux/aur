# Maintainer: T. Witt <code@amtare.eu>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=docsify-cli
pkgver=4.4.3
pkgrel=1
pkgdesc="A magical documentation generator."
arch=(any)
url="https://github.com/docsifyjs/docsify-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('docsify')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('34ad80b8f597c4afacb7e45e927b6745df11e6023ab5f2bbbd9ccebd971b3e81')
options=(!strip)

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
