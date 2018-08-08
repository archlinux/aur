pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.3.0
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/_/$_pkgname-$pkgver.tgz")
sha256sums=('e587255300cfd8e8be5afa5d9497bdb612eeeca5e165d65bd05fbd2e041ec840')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
