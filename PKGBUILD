# Author: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Yaniv Aknin (https://github.com/yaniv-aknin)
# Contributor: Fred Kuo (https://github.com/fkuo)
# Contributor: Bill Pijewski (https://github.com/pijewski)
# Maintainer: Oliver Mangold <o.mangold@gmail.com>

_npmname=jsontool
pkgname=nodejs-jsontool # All lowercase
pkgver=7.0.2
pkgrel=1
pkgdesc="a 'json' command for massaging JSON on the command line"
arch=(any)
url="http://github.com/trentm/json"
license=( 'MIT' )
depends=('nodejs')
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('9c7e82a8cd5b71b1c866c7da0e6595c15bd4ec83f288985a4ac94089b504cffb')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chown -R root:root "$pkgdir/usr"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/node_modules/$_npmname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et: