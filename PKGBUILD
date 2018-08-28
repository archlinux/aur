pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.7.0
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/_/$_pkgname-$pkgver.tgz")
sha256sums=('c8d617a00d164a0bce549eaac3fdc0691db9dc610c9e1455f76864bf6055b3fe')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
