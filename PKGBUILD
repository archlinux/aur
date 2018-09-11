# Maintainer Cookie Engineer <cookiengineer@protonmail.ch>

_npmname=mdncomp
_npmver=2.2.6
pkgname=nodejs-mdncomp # All lowercase
pkgver=2.2.6
pkgrel=1
pkgdesc="MDN Browser Compatibility Data (BCD) on the command line"
arch=(any)
url=https://github.com/epistemex/mdncomp
license=( "MIT" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('3c69f1d3a6da0266ae766fcdea002552f9ab918dfd20e60a50f5869b1bfba1c4')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir";
  local _npmdir="$pkgdir/usr/lib/node_modules/";
  mkdir -p "$_npmdir";
  cd "$_npmdir";
  npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
  $pkgdir/usr/bin/mdncomp --fupdate;
}

