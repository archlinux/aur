# Maintainer: Dhananjay Balan <mail@dbalan.in>
pkgname=nodejs-grpcc
_pkgname=${pkgname#nodejs-}
pkgver=1.1.3
pkgrel=1
pkgdesc="A command line client for gRPC servers"

arch=(any)
url="https://github.com/njpatel/grpcc#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()

source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha512sums=(b0a164d528c057c49d79c0b29490023021ec715c9ff7b8928ee435e97faa450b974b89c8695ee677617362dcaa134c02ea9283ed5b7c5ecc0786eef32ac8e1aa)

package() {
  install -dm755 "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$pkgver
}
