# Maintainer: 
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=nodejs-ajv # All lowercase
_pkgname=${pkgname#nodejs-}
pkgver=6.12.2
pkgrel=1
pkgdesc="Another JSON Schema Validator"
arch=('any')
url="https://www.npmjs.com/package/$_pkgname"
license=('MIT')
depends=('nodejs' 'npm' )
source=("http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("${source[0]##*/}")
md5sums=('5dd80999e4c4c4dd6c3c16d107e926a5')

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/${source[0]##*/}"
}
