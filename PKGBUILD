pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.9.6
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/_/$_pkgname-$pkgver.tgz")
sha256sums=('fc6ede9914fd7e96cf12b8bacf7364d215aa57b40b6b28822227cfdb32e1221a')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
