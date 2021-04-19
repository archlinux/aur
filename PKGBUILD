# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cdk8s
pkgver=1.0.0beta11
_pkgver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc="Define Kubernetes native apps and abstractions using object-oriented programming"
arch=(any)
url="https://cdk8s.io"
license=('Apache')
makedepends=('npm')
depends=('nodejs')
optdepends=('python: python language support')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
sha1sums=('987dbba569f98f63944c515c94f092f3518a8081')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname-cli@$_pkgver
  chown 0:0 -R "$pkgdir"
}
