# Maintainer: Eric Cheng <ericcheng@hey.com>

_npmname=gatsby-cli
_npmver=3.10.0
pkgname=nodejs-gatsby-cli # All lowercase
pkgver=3.10.0
pkgrel=1
pkgdesc="Gatsby command-line interface for creating new sites and running Gatsby commands"
arch=(any)
url="https://github.com/gatsbyjs/gatsby/tree/master/packages/gatsby-cli#readme"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(b5a5949893dad097715f0f36debaebafcfc47a4d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

