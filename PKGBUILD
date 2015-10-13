# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Philipp Wolfer <ph.wolfer@gmail.com>

_npmname=azure-cli
_npmver=0.9.10
pkgname=nodejs-${_npmname} # All lowercase
pkgver=${_npmver}
pkgrel=1
pkgdesc="Windows Azure Cross Platform Command Line tool"
arch=(any)
url="https://github.com/Azure/azure-xplat-cli"
license=('Apache')
depends=('nodejs' 'npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
options=(!strip)
md5sums=('214a7e713516f847d2e443ed79abda42')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
