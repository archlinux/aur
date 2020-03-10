# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=markdownlint-cli
_npmver=0.22.0
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="MarkdownLint Command Line Interface"
arch=('any')
url="https://github.com/igorshubovych/markdownlint-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --user root --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" $_npmname@$_npmver
  chmod -R 755 $_npmdir$_npmname
}
sha512sums=('a9183ab4ae5d5d6aa4685bc4b2dcfd61241a975102320a1fad266074139a3d61bc703e74a64f07b3466904227a4821cf285ef5a4276db922f6bbcdac231d9758')
