# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Andy Weidenbaum <archbaum at gmail dot com>
# Contributor: Peter Wu <lekensteyn at gmail dot com>

_npmname=grunt-cli
pkgname=nodejs-$_npmname
pkgver=1.3.2
pkgrel=1
pkgdesc="The grunt command line interface."
arch=('any')
url="http://gruntjs.com/"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('3b0a3c2aee71f1cb92984afd3fffa7882cbd40958825313946aa7f2938f67e93')
options=('!emptydirs')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  # It is not possible to package this inside a clean offline chroot due to
  # NPM bug #2568.
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
