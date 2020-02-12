pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.11.0
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('4f0c9834fc38b68b11ba045ea96a449de20cf026d9de5a8c7259160b708455e4')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
