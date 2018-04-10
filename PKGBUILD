# Maintainer: Jean Lucas <jean@4ray.co>

_npmname=stf
pkgname=nodejs-stf
pkgver=3.3.0
pkgrel=1
pkgdesc='Web application for debugging Android devices'
arch=(any)
url='https://openstf.io'
license=(Apache)
depends=('nodejs>=6.9'
         'rethinkdb>=2.2'
         graphicsmagick
         zeromq
         protobuf
         yasm
         pkg-config)
makedepends=(npm)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/stf/-/stf-$pkgver.tgz)
noextract=(stf-$pkgver.tgz)
sha512sums=(0e8bf442190a0b713c424ebcd41bd0f2b930c2e51704f9d83bb8bfc1f18bd497cbc9d8853d072d2697835b7231af48148bf91c6e5a4afde2a5ef3538f185f327)

package() {
  cd $srcdir
  local _npmdir=$pkgdir/usr/lib/node_modules
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix $pkgdir/usr stf@$pkgver
}
