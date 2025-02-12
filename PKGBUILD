pkgname=lush-shell
pkgver=0.3.1
pkgrel=1
pkgdesc="Lunar shell is a Linux shell powered by Lua."
arch=('x86_64')
url="https://github.com/BanceDev/lush"
license=('BSD-3-Clause')
depends=('lua')
makedepends=('make' 'gcc' 'premake')
source=("https://github.com/BanceDev/lush/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af1b5b1768ba561d93fc6ef1492df07b544c5c4fbaad28d0514d3274475fca26')

build() {
  cd "$srcdir/lush-$pkgver"
  sh update.sh
}

package() {
  cd "$srcdir/lush-$pkgver"
  make DESTDIR="$pkgdir" install
}

