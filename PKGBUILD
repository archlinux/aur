# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Sergiy Kukunin <sergey.kukunin@gmail.com>
pkgname=cpuminer-multi
pkgver=1.3.5
pkgrel=1
pkgdesc="Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0)"
arch=('x86_64')
url="https://github.com/tpruvot/cpuminer-multi"
license=('GPL')
depends=('curl' 'jansson' 'openssl')
provides=('cpuminer')
conflicts=('cpuminer' 'cpuminer-multi-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tpruvot/cpuminer-multi/archive/v$pkgver-multi.tar.gz")
md5sums=('246acd41dd7d8c2b4253c45ce9224a53')

build() {
  cd "$pkgname-$pkgver-multi"

  ./autogen.sh
  ./configure --prefix=/usr --with-crypto --with-curl
  make
}

package() {
  cd "$pkgname-$pkgver-multi"

  make DESTDIR="$pkgdir/" install
}
