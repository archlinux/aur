# Maintainer: Marco Pompili <aur@emarcs.org>

_npmname=nightwatch
pkgname=nodejs-$_npmname
pkgver=0.9.9
pkgrel=1
pkgdesc="Write End-to-End tests in Node.js quickly and effortlessly that run against a Selenium server."
arch=('any')
url="http://nightwatchjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('eee8843f63f2f5cf58cb2af1c533cccb79a68b0ec986e35ce7ed940fe42a758f')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
