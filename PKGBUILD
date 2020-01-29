pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.10.0
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('0af05027f5d01d9058db45d24955ba2ab41591237f9b9af62b7c8e34fb7ef055')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
