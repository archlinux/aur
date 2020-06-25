# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=docsify-cli
pkgver=4.4.1
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
sha256sums=('1a37eb5747a215a84dc347358188e0ab9856ad821b9bf9da01edf3a72e72026f')
options=(!strip)

package() {
  npm install -g --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
