# Maintainer Cookie Engineer <cookiengineer@protonmail.ch>

_npmname=mdncomp
_npmver=2.4.2
pkgname=nodejs-mdncomp # All lowercase
pkgver=2.4.2
pkgrel=1
pkgdesc="MDN Browser Compatibility Data (BCD) on the command line"
arch=(any)
url=https://github.com/epistemex/mdncomp
license=( "MIT" )
depends=('nodejs')
options=('!emptydirs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
sha256sums=('1a64d5edb724cd6eccf3bea9f9869cd5cdb89221bd88591aeafcf790d0dfa1b2')
noextract=($_npmname-$_npmver.tgz)

package() {
  cd "$srcdir";
  local _npmdir="$pkgdir/usr/lib/node_modules/";
  mkdir -p "$_npmdir";
  cd "$_npmdir";
  npm install --user root -g --prefix "$pkgdir/usr" --ignore-scripts "$_npmname@$_npmver";
  $pkgdir/usr/bin/mdncomp --fupdate;
}

