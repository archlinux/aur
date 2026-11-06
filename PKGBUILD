# Maintainer: Frestein <fresteinart@gmail.com>

pkgname=antifennel-lua54
pkgver=0.3.2
pkgrel=1
pkgdesc="Turn Lua code into Fennel code"
arch=('any')
url="https://git.sr.ht/~technomancy/antifennel"
license=('MIT')
depends=('lua54')
makedepends=('make' 'pandoc')
provides=('antifennel')
conflicts=('antifennel' 'antifennel-lua55' 'antifennel-git')
source=("${pkgname%-lua54}-${pkgver}.tar.gz::https://git.sr.ht/~technomancy/antifennel/archive/${pkgver}.tar.gz")
sha256sums=('5246ccb8df476f37515a1aca1b30ae0039f4f88a273951a7eff42ecfb555f4d4')

build() {
  cd "$srcdir/${pkgname%-lua54}-${pkgver}"
  make LUA=lua5.4
}

package() {
  cd "$srcdir/${pkgname%-lua54}-${pkgver}"
  make install PREFIX="$pkgdir/usr"
}
