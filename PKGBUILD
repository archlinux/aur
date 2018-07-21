# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf
pkgver=3.3.1
pkgrel=1
pkgdesc='Web application for debugging Android devices'
arch=(i686 x86_64)
url=https://openstf.io
license=(Apache)
depends=(nodejs-lts-carbon
         rethinkdb
         graphicsmagick
         zeromq
         protobuf
         yasm
         pkg-config)
makedepends=(npm)
options=(!emptydirs !strip)
source=(https://github.com/openstf/stf/archive/v$pkgver.tar.gz)
sha512sums=(f5be802444f5a76a8404858690874998168faea672af0fa89e6af2055c27ee33e35c24ad333bee606fbda653b831bbea2433076ba328c49d69518e44af19edfe)

build() {
  cd stf-$pkgver
  npm install
}

package() {
  install -d $pkgdir/usr/{share/stf,share/licenses/stf,bin}
  cd stf-$pkgver
  cp -a . $pkgdir/usr/share/stf
  ln -s /usr/share/stf/bin/stf $pkgdir/usr/bin/stf
  cp LICENSE $pkgdir/usr/share/licenses/stf/LICENSE
}
