_npmname=hubot
_npmver=2.12.0
pkgname=nodejs-hubot # All lowercase
pkgver=2.12.0
pkgrel=1
pkgdesc="A simple helpful robot for your Company"
arch=(any)
url="https://github.com/github/hubot"
license=(MIT)
depends=('nodejs' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(bf67686741740f41ba09a6a1d5b269ca66d5933d)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et: