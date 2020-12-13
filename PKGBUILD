# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=markdownlint-cli
_npmver=0.25.0
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
sha512sums=('a668972603d0b40c7a60e3173c208edc0b9d316bfc1a785fae9ae7d2b6aa7afa1f3a13bde67259e9b4c45e45156f3130bd886f1b1134625f3cf1a670b9118c1b')
