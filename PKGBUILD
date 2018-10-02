# Author: Lukas Grossar <lukas.grossar@gmail.com
# Maintainer: Lukas Grossar <lukas.grossar@gmail.com
_npmname=commitizen
_npmver=3.0.1
pkgname=nodejs-commitizen
pkgver=3.0.1
pkgrel=1
pkgdesc="Git plugin to help you write consistent commit messages"
arch=(any)
url="https://github.com/commitizen/cz-cli"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha512sums=('8a4726cea3db4a3dc30e46a140dc396016c228b3ef94f77cc94724a7c60afffd50fe7704264961e466a98a310e3f3e2e2c159f247f6f98ac16b61994fc7017ae')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:<Paste>
