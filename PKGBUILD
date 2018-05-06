# Maintainer: KarlFiabeschi 1984itsnow[at]gmail[dot]com

_npmname=soccer-go
pkgname=nodejs-soccer-go 
pkgver=0.4.0
pkgrel=2
pkgdesc="soccer-go is a node command line application to gather soccer stats and results"
arch=('any')
url="https://github.com/acifani/soccer-go"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=(8bc9ba5779bc8175b244cd885a802d7867efbe1ea21b03c3ec97e8a8012ea873)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # fix perms
  chmod 755 ${pkgdir}/usr/bin
  find ${pkgdir}/usr/lib/node_modules/ -type d -exec chmod 755 {} +
}
