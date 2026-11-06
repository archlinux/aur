# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=antifennel-git
pkgver=0.3.2.r2.g613a075
pkgrel=1
pkgdesc="Turn Lua code into Fennel code"
arch=('any')
url="https://git.sr.ht/~technomancy/antifennel"
license=('MIT')
depends=('luajit')
makedepends=('git' 'make' 'pandoc')
provides=('antifennel')
conflicts=('antifennel' 'antifennel-lua55' 'antifennel-lua54')
source=("${pkgname}::git+https://git.sr.ht/~technomancy/antifennel")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make install PREFIX="$pkgdir/usr"
}
