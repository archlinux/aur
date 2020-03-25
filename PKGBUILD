# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: TJ Holowaychuk <tj at vision-media dot ca>
# Contributor: Travis Jeffery <tj at travisjeffery dot com>

_npmname=mocha
pkgname=nodejs-$_npmname
pkgver=7.1.1
pkgrel=1
pkgdesc="Simple, flexible, fun test framework."
arch=(any)
url="https://mochajs.org"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('9b13b891e87df4837eb1bad2815a280c973f95360ec557dfd6afdd2334f75d6a')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
