# Maintainer Cookie Engineer <cookiengineer@protonmail.ch>

_npmname=mdncomp
_npmver=2.5.0
pkgname=nodejs-mdncomp # All lowercase
pkgver=2.5.0
pkgrel=1
pkgdesc="MDN Browser Compatibility Data (BCD) on the command line"
arch=(any)
url=https://github.com/epistemex/mdncomp
license=( "MIT" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('50f03a52e4254a17de7aa6f81d9bd0a0f56bad7c6475cab7a524897c3e958718')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir";
  local _npmdir="$pkgdir/usr/lib/node_modules/";
  mkdir -p "$_npmdir";
  cd "$_npmdir";
  npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
  $pkgdir/usr/bin/mdncomp --fupdate;
}

