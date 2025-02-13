pkgname=lush-shell
pkgver=0.3.2
pkgrel=4
pkgdesc="Lunar shell is a Linux shell powered by Lua."
arch=('x86_64')
url="https://github.com/BanceDev/lush"
license=('BSD-3-Clause')
depends=('lua')
makedepends=('make' 'gcc' 'premake')
source=("https://github.com/BanceDev/lush/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2084242b675a765ff91da997c21c4b1c5703aaa5b7475da11753358576b628fa')
install=lush-shell.install

build() {
  cd "$srcdir/lush-$pkgver"
  premake5 gmake
  make
}

package() {
  cd "$srcdir/lush-$pkgver"

  # install binary
  install -Dm755 bin/Debug/lush/lush "$pkgdir/usr/bin/lush"

}

