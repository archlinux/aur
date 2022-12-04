# Maintainer: Santiago Avila Gómez <santiavilag2015@gmail.com>

_npmname=mctranslate-cli
_npmver=1.0.1
pkgname=mctranslate-cli # All lowercase
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI Tool for translate a sentence into minecraft enchanting alphabet"
arch=(any)
url="undefined"
license=('GNU General Public License v3.0')
depends=('nodejs' 'npm' 'java-runtime')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(7ec77f25399e0d9f0d0431ec3df2646a92df1e04)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
