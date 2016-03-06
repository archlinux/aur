# Maintainer: Sergiy Kukunin <sergey.kukunin@gmail.com>

pkgname=cpuminer-multi
pkgver=1.2
pkgrel=1
pkgdesc="Multi-algo CPUMiner & Reference Cryptonote Miner (JSON-RPC 2.0)"
arch=('i686' 'x86_64')
url="https://github.com/tpruvot/cpuminer-multi"
depends=('curl' 'jansson')
license=('GPL')
source=("${pkgname}-${pkgver}.zip::https://github.com/tpruvot/cpuminer-multi/archive/v${pkgver}-multi.zip")
md5sums=('177b5f125636befa47db77d2d61e1bd6')

build() {
  cd "$srcdir/$pkgname-$pkgver-multi"
  ./build.sh
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 "$srcdir/$pkgname-$pkgver-multi/cpuminer" "$pkgdir/usr/bin/"
}
