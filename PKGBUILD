# Maintainer: Ainola

pkgname=unruu
pkgver=0.1.1
pkgrel=1
pkgdesc='Extracts HTC RUU'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('unshield')
url='https://github.com/kmdm/unruu/'
source=('https://github.com/kmdm/unruu/archive/v0.1.1.tar.gz')
sha256sums=('dda9a7d33c283a772131a19c05a5225ed8e4307e20c33c8c9914801ebc2c0f96')

build() {
  cd "$srcdir/unruu-$pkgver"
  ./autogen.sh
  ./configure
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/unruu-$pkgver/unruu" "$pkgdir/usr/bin/unruu"
}
