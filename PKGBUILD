_npmname=angular-cli
_npmver=1.0.0-beta.25.5
pkgname=angular-cli # All lowercase
pkgver=1.0.0_beta.25.5
pkgrel=1
pkgdesc="CLI tool for Angular"
arch=(any)
url="https://github.com/angular/angular-cli"
license=()
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(06eeb0395f63d69d39326f2a2ebc47b8d5145db8)
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
}

# vim:set ts=2 sw=2 et:
