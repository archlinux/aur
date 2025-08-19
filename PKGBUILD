pkgname=lush-shell
pkgver=0.4.0
pkgrel=5
pkgdesc="Lunar shell is a Linux shell powered by Lua."
arch=('x86_64')
url="https://github.com/BanceDev/lush"
license=('BSD-3-Clause')
depends=('lua')
makedepends=('make' 'gcc' 'premake')
source=("https://github.com/BanceDev/lush/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb561313f7a8e250afb01f53aba900878a4ee95bbaa0aeef2e264852306184cb')
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

