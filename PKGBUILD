# Maintainer: Marco Pompili <aur@emarcs.org>

_npmname=nightwatch
pkgname=nodejs-$_npmname
pkgver=0.9.13
pkgrel=1
pkgdesc="Write End-to-End tests in Node.js quickly and effortlessly that run against a Selenium server."
arch=('any')
url="http://nightwatchjs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('2b93e4b0fd96389963eed79e50b3930dfff1a036994f2a4ccb3b986ba1f56979')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npmname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$_npmname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/"
}
