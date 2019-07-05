pkgname=nodejs-fauna-shell
_pkgname=${pkgname#nodejs-}
pkgver=0.9.3
pkgrel=1
pkgdesc="faunadb access via the cli"
arch=(any)
url="https://github.com/fauna/fauna-shell"
licence=(MPL2)
depends=(nodejs)
makedepends=(npm)
source=("https://registry.npmjs.org/$_pkgname/_/$_pkgname-$pkgver.tgz")
sha256sums=('07d0d12bd9b18e2dc266fc45efd67bcd3ddd35eb915c9ee669644063d61f4290')
noextract=("$_pkgname-$pkgver.tgz")

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/"$_pkgname-$pkgver.tgz"
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
