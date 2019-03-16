# Maintainer: KarlFiabeschi 1984itsnow[at]gmail[dot]com

_npmname=soccer-go
pkgname=nodejs-soccer-go
pkgver=0.5.1
pkgrel=1
pkgdesc="soccer-go is a node command line application to gather soccer stats and results"
arch=('any')
url="https://github.com/acifani/soccer-go"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('da0b90ee3906b1cf80b98c1d3c1238e6602ad7ee97a78c9a12d983ac7e2f346e')

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
