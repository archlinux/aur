# Maintainer: Marco Pompili <aur@emarcs.org>

_npmname=nightwatch
pkgname=nodejs-$_npmname
pkgver=0.8.18
pkgrel=1
pkgdesc="Write End-to-End tests in Node.js quickly and effortlessly that run against a Selenium server."
arch=('any')
url="http://nightwatchjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('b8cf03d946a42a0b67a16a7897d73672d8b6b9a962e2a1f988d0906e96399f6d')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/"
}
