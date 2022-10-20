# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=aws-cdk
pkgname=aws-cdk-v1
pkgver=1.178.0
pkgrel=1
pkgdesc="CDK Toolkit, the command line tool for CDK apps"
arch=(any)
url="https://github.com/awslabs/aws-cdk#readme"
license=('Apache')
provides=(aws-cdk)
conflicts=(aws-cdk)
makedepends=('npm')
depends=('nodejs')
optdepends=('python: python language support')
source=(http://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz)
sha1sums=('6af1461c21976602e453df351b0e3c2ecfbe3a00')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_pkgname@$pkgver
  chown 0:0 -R "$pkgdir"
}
