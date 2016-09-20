# Author: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Yaniv Aknin (https://github.com/yaniv-aknin)
# Contributor: Fred Kuo (https://github.com/fkuo)
# Contributor: Bill Pijewski (https://github.com/pijewski)
# Maintainer: Oliver Mangold <o.mangold@gmail.com>

_npmname=json
pkgname=nodejs-json
pkgver=9.0.4
pkgrel=1
pkgdesc="a 'json' command for massaging JSON on the command line"
arch=(any)
url="http://github.com/trentm/json"
license=( 'MIT' )
depends=('nodejs')
makedepends=('npm')
replaces=('nodejs-jsontool')
conflicts=('nodejs-jsontool')
provides=('nodejs-jsontool')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('62924b083a96fdfa011c892789e0b298f0f91df8ce6115706506f9681f903494')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chown -R root:root "$pkgdir/usr"
  install -d "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/share"
  mv "$pkgdir/usr/lib/node_modules/json/man" "$pkgdir/usr/share/"
  ln -s "/usr/lib/node_modules/$_npmname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et: