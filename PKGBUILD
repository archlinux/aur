# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.3.1.2
pkgrel=0
pkgdesc="An extensible proxy which prevents some ISP from detecting network traffic."
url="https://github.com/SnakeSocks/$pkgname"
license=("GPL2")
arch=("i686" "x86_64")
depends=("glibc>=2.14" "gcc-libs")
makedepends=("boost>=1.55" "go" "cmake>=3.5" "make")
conflicts=("$pkgname-bin")
replaces=("$pkgname-bin")
backup=("etc/$pkgname/conf/client.conf" "etc/$pkgname/conf/server.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
validpgpkeys=("00D386A853D34998CC1D232A99B730DA4B48AF32")
sha256sums=("30e5dd69194f83d040e6daae388a4d3b87b2044a0009f1ab3692bfd1916ed994")

package() {
  export pkgdir
  cd "$pkgname-$pkgver"
  make default_modules
  make client # requires cmake and boost
  make server # requires go. comment it if you dont want it.
  make install
}

