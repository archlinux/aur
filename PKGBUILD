# Maintainer: Ivan Fonseca <ivanfon[at]riseup[dot]net>

pkgname=fkill
pkgver=3.7.0
pkgrel=1
pkgdesc="A simple command line app to ease quickly killing processes."
arch=(any)
url="https://github.com/sindresorhus/fkill-cli"
license=(MIT)
depends=("nodejs" "npm")
optdepends=()
 # package name on NPM
npmname=fkill-cli
source=(https://registry.npmjs.org/$npmname/-/$npmname-$pkgver.tgz)
noextract=($npmname-$pkgver.tgz)
sha256sums=("502f47e7f157aa582148bca7983f28faa50c9d07206cf80308dd283675c28db5")

package() {
  cd "$srcdir"
  local npmdir="$pkgdir/usr/lib/node_modukes/"
  mkdir -p "$npmdir"
  cd "$npmdir"
  npm install -g --prefix "$pkgdir/usr" $npmname@$pkgver
}

