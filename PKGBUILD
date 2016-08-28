# Maintainer: Nicholas Yim <nickyim05@gmail.com>
pkgname=twister-core
pkgver=0.9.34
pkgrel=2
pkgdesc="Twister core - p2p microblogging"
arch=(i686 x86_64)
url="http://twister.net.co/"
#git source
#https://github.com/miguelfreitas/twister-core/
license=('MIT' 'BSD')
groups=()
depends=(openssl db boost-libs miniupnpc)
makedepends=('git' 'boost')
source=("https://github.com/miguelfreitas/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("44308e19dc518fcf9a1407e71985ececaee7460bacab593264a2ffadd5c15bc3cae9318cb1843e865f636de62c51e158635d0b342433a5595c3b4c534f91ae22")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./bootstrap.sh --enable-logging --enable-dht
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p "$pkgdir/usr/bin/"
  install twisterd "$pkgdir/usr/bin/"
}

