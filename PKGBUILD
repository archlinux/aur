# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds
pkgver=0.3.9
pkgrel=1
pkgdesc="Rednex GameBoy Development System"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('MIT')
depends=('libpng')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('4ddebdc9857e3d7cd514b017a79fc28f031c2df9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION_STRING=$pkgver
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr mandir="/usr/share/man" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
