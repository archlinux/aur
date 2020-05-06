# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=(nodejs-aws-cdk)
pkgver=1.37.0
pkgrel=1
pkgdesc="CDK Toolkit, the command line tool for CDK apps"
arch=(any)
url="https://github.com/awslabs/aws-cdk#readme"
license=('Apache')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha1sums=('2e6ad6853b32c2b35e163d4abd9eeffb1c95e723')

#package_nodejs-aws-cdk() {
#  depends=(aws-cdk)
#}

package_nodejs-aws-cdk() {
  depends=('nodejs')
  optdepends=('python: python language support')

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
