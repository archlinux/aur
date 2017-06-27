# Maintainer: Marco Pompili <aur (at) emarcs (dot) org>

_npmname=nightwatch
pkgname=nodejs-$_npmname
pkgver=0.9.16
pkgrel=1
pkgdesc="Write End-to-End tests in Node.js quickly and effortlessly that run against a Selenium server."
arch=('any')
url="http://nightwatchjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('e37825d35c4b7d4263d49a66fbd1a8b0aae1a913bc1c84d1679fa73e17510b5e')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
