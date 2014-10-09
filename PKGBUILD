pkgname=quicktun
arch=(i686 x86_64)
pkgver=2.2.4
pkgrel=1
pkgdesc="QuickTun is a simple and secure VPN software"
depends=('libsodium')
url="http://wiki.ucis.nl/QuickTun"
license=('Custom')
source=(http://oss.ucis.nl/quicktun/src/${pkgname}-${pkgver}.tgz)

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  CFLAGS=-Wno-pointer-to-int-cast ./build.sh
}

package () {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -D out/quicktun.combined "${pkgdir}/usr/bin/quicktun.combined"
  install -D out/quicktun.keypair "${pkgdir}/usr/bin/quicktun.keypair"
  ln -s quicktun.combined "${pkgdir}/usr/bin/quicktun"
}


sha512sums=('da60fc39d8e85d5b2c162633840b887be3fd58d9f2b3a99fe605fa13546e4f53878ce6246d835b7931e42193fb044330c539b29751cdb6f54d025efc52041487')
