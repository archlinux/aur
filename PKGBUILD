# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.4.0
pkgrel=0
pkgdesc="An extensible proxy which prevents some ISP from detecting network traffic."
url="https://github.com/SnakeSocks/$pkgname"
license=("GPL2")
arch=("i686" "x86_64")
depends=("glibc>=2.14" "gcc-libs")
makedepends=("boost>=1.55" "cmake>=3.5" "make")
conflicts=("$pkgname-bin")
replaces=("$pkgname-bin")
backup=("etc/$pkgname/conf/client.conf" "etc/$pkgname/conf/server.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
validpgpkeys=("00D386A853D34998CC1D232A99B730DA4B48AF32")
sha256sums=("5448ce9e4762de58cce32aa021cae1abf9f03a2a3022ba594f0af18fe6b652dc")

package() {
  export pkgdir
  cd "$pkgname-$pkgver"
  make default_modules
  make native # requires cmake and boost
  # SnakeSocks 1.4.0+ provides both native client and native server, with 'make native'
  make install
}

