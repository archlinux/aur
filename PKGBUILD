# Maintainer: Achilleas Pipinellis <axilleas at archlinux dot gr>

_npmname=markdownlint-cli
_npmver=0.18.0
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
sha512sums=('990db3be330ba32d0fda46fd634dd2a82db858f1f87d344dd3f0b20a8ac1d76d9ce02860f6f5892a050a073dca47bb30a73aa6948d1262affb0656ea7b891bda')
