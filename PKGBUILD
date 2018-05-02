# Maintainer: KarlFiabeschi 1984itsnow[at]gmail[dot]com

_npmname=soccer-go
pkgname=nodejs-soccer-go 
pkgver=0.3.4
pkgrel=1
pkgdesc="soccer-go is a node command line application to gather soccer stats and results"
arch=('any')
url="https://github.com/acifani/soccer-go"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=(c1f534aaf0bff0388a042af4a2b352b2833ec46117cc6657a95fd5bade006ae9)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # fix perms
  chmod 755 ${pkgbuild}/usr/bin
  find ${pkgdir}/usr/lib/node_modules/ -type d -exec chmod 755 {} +
}
