# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: Peter Wu <lekensteyn at gmail dot com>

_npmname=grunt-cli
pkgname=nodejs-$_npmname
pkgver=0.1.13
pkgrel=6
pkgdesc="The grunt command line interface."
arch=('any')
url="http://gruntjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e639404d7b66ae2821edabc681104a1f035910ff20a2e21d67329c2a7674a443')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver

  rmdir "$pkgdir"/usr/etc
}
