# Maintainer: Kusoneko <kusoneko@kusoneko.moe>

_npmname=keyoxide
_npmver=0.4.4
pkgname=nodejs-keyoxide
pkgver=0.4.4
pkgrel=1
pkgdesc="CLI for Keyoxide"
arch=(any)
url="https://keyoxide.org"
license=(AGPL-3.0-or-later)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(38bc2cbb149eb8456d96fed66c1264a969a234d0)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  chown -R root:root "$pkgdir"
}
