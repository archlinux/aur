# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

pkgname=cpuminer-opt
pkgver=3.9.1.1
pkgrel=1
pkgdesc='Optimized multi-algo CPU miner'
arch=('x86_64')
url='https://github.com/JayDDee/cpuminer-opt'
license=('GPL')
depends=('curl' 'gmp' 'jansson' 'openssl')
provides=('cpuminer' 'cpuminer-multi')
conflicts=('cpuminer' 'cpuminer-multi' 'cpuminer-multi-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JayDDee/cpuminer-opt/archive/v$pkgver.tar.gz")
sha256sums=('8a842ac6597c7dae9f13eaf0b6ee0dbd7fe130f0b61d0307527b0a89b1826170')

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
