# Maintainer: Jean Lucas <jean@4ray.co>

_npmname=weex-toolkit
pkgname="nodejs-$_npmname"
pkgver=1.0.3
pkgrel=1
pkgdesc="Apache Weex CLI toolkit"
arch=('any')
url="https://www.npmjs.com/package/$_npmname"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
conflicts=('weex')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=('$_npmname-$pkgver.tgz')
sha256sums=('d1c819fd7b31328b02490b5f3f41ce68d7f9d211fa9bd5a8f7a583e5b5f0b288')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
}
