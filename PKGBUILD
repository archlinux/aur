# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-cdk
pkgver=2.127.0
pkgrel=1
pkgdesc="CDK Toolkit, the command line tool for CDK apps"
arch=(any)
url="https://github.com/awslabs/aws-cdk#readme"
license=('Apache')
makedepends=('npm')
depends=('nodejs')
optdepends=('python: python language support')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha1sums=('54d2b70a87366bee66e557e7192d756ae246fff6')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
  chown 0:0 -R "$pkgdir"
}
