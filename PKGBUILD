# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cdk8s
pkgver=1.0.0beta2
_pkgver=${pkgver/beta/-beta.}
pkgrel=1
pkgdesc="Define Kubernetes native apps and abstractions using object-oriented programming"
arch=(any)
url="https://cdk8s.io"
license=('Apache')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
sha1sums=('3b15a72fbc5acda0c74d30d5051e630d9282804a')

package() {
  depends=('nodejs')
  optdepends=('python: python language support')

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname-cli@$_pkgver
}
