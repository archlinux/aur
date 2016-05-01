# Maintainer: Daniel Maslowski <info@orangecms.org>

_npmname=npm-profile-manager
_npmver=0.1.1
pkgname=nodejs-$_npmname
pkgver=$_npmver
pkgrel=1
pkgdesc="Profile management for npm"
arch=('any')
url="http://github.com/danielmoore/npm-profile-manager"
license=('MIT')
depends=('nodejs')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
sha1sums=('802bc688f6e9661ed4cc26b02f4d2e7abd26f384')

package() {
  cd "$srcdir/package"
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  rmdir "$pkgdir/usr/etc"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
