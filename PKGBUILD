# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=cdk8s
pkgver=1.0.0beta10
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
sha1sums=('4907263bcf4fbbdc81e3a70f12a620597d4e971f')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname-cli@$_pkgver
  chown 0:0 -R "$pkgdir"
}
