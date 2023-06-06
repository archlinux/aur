# Maintainer: 	whitels <2959471117 at qq dot com>

_npmname=whistle.script
_npmver=1.2.9
_npmrel=1
pkgname=nodejs-whistle-plugins-script # All lowercase
pkgver=1.2.9
pkgrel=1
pkgdesc="The plugin for the extension script for whistle"
arch=(any)
url="https://github.com/whistle-plugins/whistle.script"
license=(MIT)
depends=('nodejs-whistle')
optdepends=()
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=(${_npmname}-${_npmver}.tgz)
sha1sums=('90d3520aefce5366390b2501c3a7faf51313cf9c')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
