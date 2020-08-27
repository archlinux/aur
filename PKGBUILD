# Maintainer: Hugues Chabot <at google mail>
_npmname=serverless
_npmver=2.12.0
pkgname=nodejs-serverless # All lowercase
pkgver=2.12.0
pkgrel=1
pkgdesc="Serverless Framework - Build web, mobile and IoT applications with serverless architectures using AWS Lambda, Azure Functions, Google CloudFunctions & more"
arch=(any)
url="https://serverless.com/framework/docs/"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(5e993a5c27c22b2cf603d8e97bafa7b7f619a1af)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" --ignore-scripts $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
