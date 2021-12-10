# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=cdk8s-cli
pkgver=1.0.48
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
sha256sums=('5e362c7be68ff7033c263708a54a13b582501c32bdecf2ae7bea34c74f05c8dd')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$_pkgver
  chown 0:0 -R "$pkgdir"
}
