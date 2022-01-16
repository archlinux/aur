# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=cdk8s-cli
pkgver=1.0.78
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
sha256sums=('7719593312efc6c19df597def23df703982aa1ce99d9de2f2e1310590ba0f683')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$_pkgver
  chown 0:0 -R "$pkgdir"
}
