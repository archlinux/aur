# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.3.0
pkgrel=3
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
sha256sums=("5220419a6149efe99741585be3da227369ec7112ef46d26de81c99c94e4a1640")

package() {
  export pkgdir
  cd "$pkgname-$pkgver"
  make default_modules
  make client # requires cmake and boost
  make server # requires go. comment it if you dont want it.
  make install
}

