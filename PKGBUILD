# Maintainer: Jochen Saalfeld <jochen@intevation.de>
pkgname='shallot'
pkgver=0.0.6
pkgrel=1
pkgdesc="Hashing for specific vanity onion adresses"
arch=('x86_64')
url="https://github.com/jsaalfeld/Shallot"
license=('NONE')
provides=('shallot')
conflicts=()
makedepends=('make' 'openssl' )
source=("https://github.com/jsaalfeld/Shallot/archive/$pkgname-$pkgver.tar.gz" )
md5sums=('afde1bbf4a5de9d9baf40cc2c5035fe4')
sha256sums=('d38f10437b0335b6ab1e2b22789f35340c0d8a7cf188c1b88716cbcda753e782')

build() {
  cd "Shallot-$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "Shallot-$pkgname-$pkgver"
  mkdir $pkgdir/bin
  make DESTDIR="$pkgdir" install
}

