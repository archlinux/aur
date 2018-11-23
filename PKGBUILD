pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.8.1
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/_/$_pkgname-$pkgver.tgz")
sha256sums=('77cb9bf3ff3999cd9e5183bccd29b74967b9b3a3179500678e0f4680c805ff97')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
