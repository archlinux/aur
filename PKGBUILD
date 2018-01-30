# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>

pkgname=fkill
pkgver=4.0.0
pkgrel=1
pkgdesc="Quickly kill processes from the command line."
arch=(any)
url="https://github.com/sindresorhus/fkill-cli"
license=(MIT)
depends=("nodejs" "npm")
optdepends=()
 # package name on NPM
npmname=fkill-cli
source=(https://registry.npmjs.org/$npmname/-/$npmname-$pkgver.tgz)
noextract=($npmname-$pkgver.tgz)
sha256sums=('ddbabdf02bba864dd84666d52fd4ce60156acfe74c2372c94902b29bf8072ff1')

package() {
  cd "$srcdir"
  local npmdir="$pkgdir/usr/lib/node_modukes/"
  mkdir -p "$npmdir"
  cd "$npmdir"
  npm install -g --prefix "$pkgdir/usr" $npmname@$pkgver
}

