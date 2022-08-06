# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=cdk8s-cli
pkgver=2.0.75
_pkgver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc="Define Kubernetes native apps and abstractions using object-oriented programming"
arch=(any)
url="https://cdk8s.io"
license=('Apache')
makedepends=('npm')
depends=('nodejs')
optdepends=('python: python language support')
source=()
sha256sums=()

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$_pkgver
  chown 0:0 -R "$pkgdir"
}
