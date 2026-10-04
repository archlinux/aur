# Maintainer: stealthninja (realstealthninja@gmail.com)

pkgname=aspell-ml
pkgver=0.04_1
pkgrel=1
pkgdesc="Malayalam dictionary for aspell"
arch=("any")
url="https://gitlab.com/smc/spellcheck"
license=("GPL-3.0-or-later")
depends=("aspell")
source=("https://download.savannah.nongnu.org/releases/smc/Spellchecker/aspell6-ml-${pkgver//_/-}.tar.bz2")
md5sums=("bd6fadf1074f9c909d08b400d2ad5771")
sha256sums=("b9352bee5e111f676640c958d1abf99b7382e780b2059c54abbf9c08497ee1c3")

build() {
  cd "$srcdir/aspell6-ml-${pkgver//_/-}"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-ml-${pkgver//_/-}"
  make DESTDIR="$pkgdir" install

  install -D -m644 Copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
