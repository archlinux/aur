# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-cdk
pkgver=2.1129.0
pkgrel=1
pkgdesc="CDK Toolkit, the command line tool for CDK apps"
arch=(any)
url="https://github.com/aws/aws-cdk-cli#readme"
license=('Apache')
makedepends=('npm')
depends=('nodejs')
optdepends=('python: python language support')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha1sums=('4f8d59001c8ca577ff21671601152460a396c652')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  chown 0:0 -R "$pkgdir"
}
