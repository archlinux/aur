# Maintainer: Eric Cheng <eric@chengeric.com>

_npmname=gatsby-cli
_npmver=4.11.2
pkgname=nodejs-gatsby-cli # All lowercase
pkgver=4.11.2
pkgrel=1
pkgdesc="Gatsby command-line interface for creating new sites and running Gatsby commands"
arch=(any)
url="https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0bd5c218f378edb0e674f7ba7a903be202fe3620)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
