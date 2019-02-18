# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.3.8
pkgrel=1
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
depends=('libpng')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('82935f733aadf04c1f00594b70779ab4f7b6430a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr mandir="/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
