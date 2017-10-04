# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.2.1
pkgrel=1
pkgdesc="An extensible proxy which prevents some ISP from detecting network traffic."
url="https://github.com/SnakeSocks/$pkgname"
license=("GPL2")
arch=("i686" "x86_64")
depends=("glibc>=2.14")
makedepends=("boost>=1.55" "go" "cmake>=3.5" "make")
conflicts=("$pkgname-bin")
replaces=("$pkgname-bin")
backup=("etc/$pkgname/conf/client.conf" "etc/$pkgname/conf/server.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("f5ee3440b4a5ccf1156f821c38963a3b83a8eed366549deaf0eb2e0087869f5c")

package() {
  export pkgdir
  cd "$pkgname-$pkgver"
  make client # requires cmake and boost
  make server # requires go. comment it if you dont want it.
  make install
}

