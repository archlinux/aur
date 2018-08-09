# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=stf
pkgver=3.4.0
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
options=(!strip)
source=(https://github.com/openstf/stf/archive/v$pkgver.tar.gz)
sha512sums=('dbd51aeb59a77db235b8a271464f8304ae2882fe10cf4369ea0d606231b1255eb353c8b1bd27cb0ff1f8541b6daa1e9f8b6b05ec989e62e226d01158421d480b')

build() {
  cd stf-$pkgver
  npm install
}

package() {
  cd stf-$pkgver
  install -d "$pkgdir"/usr/{share/stf,bin,share/licenses/stf}
  cp -a . "$pkgdir"/usr/share/stf
  ln -s /usr/share/stf/bin/stf "$pkgdir"/usr/bin/stf
  cp LICENSE "$pkgdir"/usr/share/licenses/stf
}
