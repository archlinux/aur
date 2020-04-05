# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.4.0
pkgrel=1
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
depends=('libpng')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('1468d4930f50e9512e35fa250a86614bbcf197b9')

build() {
  cd "$srcdir/$pkgname"
  make VERSION_STRING=$pkgver
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr mandir="/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
