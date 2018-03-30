# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>

pkgname=fkill
pkgver=4.1.0
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
sha256sums=('aa7a08cc6a883871ea9b40ce13b8d6a261f0c774ffcbdd37c47e2e5018876bad')

package() {
  cd "$srcdir"
  local npmdir="$pkgdir/usr/lib/node_modukes/"
  mkdir -p "$npmdir"
  cd "$npmdir"
  npm install -g --prefix "$pkgdir/usr" $npmname@$pkgver
}

