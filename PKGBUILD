pkgname=nodejs-doctoc # All lowercase
pkgver=1.1.1
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
sha256sums=(1184c51c5f6ae937eb28e5918c91dbad8cb670a372d5fa38b10cc4d57be98ca5)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
