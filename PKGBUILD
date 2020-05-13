_npmname=hubot
_npmver=3.3.2
pkgname=nodejs-hubot # All lowercase
pkgver=3.3.2
pkgrel=1
pkgdesc="A simple helpful robot for your Company"
arch=(any)
url="https://github.com/github/hubot"
license=(MIT)
depends=('nodejs' 'npm') 
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=('eee5781f7f68b29651e94407c81282ea9aa2af4d06919dfd81b9bae301bff918')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
