# Maintainer: Mathieu Clabaut <mathieu@clabaut.net>

pkgname=nodejs-maildev
_pkgname=${pkgname#nodejs-}
pkgver=2.0.5
pkgrel=1
pkgdesc="SMTP Server + Web Interface for viewing and testing emails during development."
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
depends=('nodejs' 'npm' )
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${source[0]##*/}")

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}
md5sums=('22ee548a327b0d9255f9cc5af4d44e80')
