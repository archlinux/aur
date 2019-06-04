# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.9.2
pkgrel=1
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-multi-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JayDDee/cpuminer-opt/archive/v$pkgver.tar.gz")
sha256sums=('26cb3d4e493b8a1dfab2b71729923f8c6e2f1da6e81205beb24ff35bcb45a915')

build() {
  cd "$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
