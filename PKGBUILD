# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Eric Cheng <eric@chengeric.com>

_npmname=gatsby-cli
_npmver=5.14.0
pkgname=nodejs-gatsby-cli # All lowercase
pkgver=5.14.0
pkgrel=1
pkgdesc="Gatsby command-line interface for creating new sites and running Gatsby commands"
arch=(any)
url="https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=(36fb16b2e65da4d452b660ec359698bde89f16b16a14dcb8ae71422c0596821cb1524b3caa11b0cbac2bcf691c50af98dac449267d5e223830ce2d40c859f97d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
