# Maintainer: Yufan You <ouuansteve at gmail>
# Author: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Trent Mick <trentm@gmail.com> (http://trentm.com)
# Contributor: Yaniv Aknin (https://github.com/yaniv-aknin)
# Contributor: Fred Kuo (https://github.com/fkuo)
# Contributor: Bill Pijewski (https://github.com/pijewski)
# Contributor: Oliver Mangold <o.mangold@gmail.com>

_npmname=json
pkgname=nodejs-json
pkgver=11.0.0
pkgrel=1
pkgdesc='A "json" command for massaging JSON on your Unix command line.'
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
sha256sums=('cf9adea69034d7b05bf7a76604eed743d98579d4ccb368184c2594588d85cdc0')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "$pkgdir"
}
