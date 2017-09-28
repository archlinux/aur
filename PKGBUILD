# maintainer: orumin <dev at orum.in>

_npmname=slack-tui
_npmver=0.1.2
pkgname=nodejs-slack-tui # All lowercase
pkgver=0.1.2
pkgrel=1
pkgdesc="TUI-based Slack client."
arch=(any)
url="https://github.com/hikalium/slack-tui#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(05068168680352056c4ff74b78076bf25f634257)

package() {
  cd $srcdir
  tar xzf $_npmname-$_npmver.tgz
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/slack-tui/LICENSE"
}

# vim:set ts=2 sw=2 et:
