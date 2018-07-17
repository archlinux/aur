# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Mark Pustjens <pustjens at dds dot nl>

_npmname=express
pkgname=nodejs-$_npmname
pkgver=4.16.3
pkgrel=1
pkgdesc="Fast, unopinionated, minimalist web framework."
arch=('any')
url="https://expressjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('7e6e24c704d81f81b24f19e6faf1613b3eca752363b755e61debe02ef77a0ca8')

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -Dm0644 "$pkgdir/usr/lib/node_modules/$_npmname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
