pkgname=nodejs-doctoc # All lowercase
pkgver=1.0.0
pkgrel=1
_npmname=doctoc
pkgdesc="Generates TOC for markdown files of local git repo."
arch=(any)
url="https://github.com/thlorenz/doctoc"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz)
noextract=(${_npmname}-${pkgver}.tgz)
sha256sums=(f630cbb4aeeab2b08abf4c232dd5480af22298ea03e5a0c7c13a2c6765c0a632)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
