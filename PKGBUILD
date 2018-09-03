# Maintainer: Florian Pelz <pelzflorian at pelzflorian.de>
pkgname=haunt
pkgver=0.2.2
pkgrel=1
pkgdesc="Static site generator written in Guile Scheme"
arch=('any')
url="https://haunt.dthompson.us"
license=('GPL3')
depends=('guile')
optdepends=('guile-reader: Skribe support'
            'guile-commonmark: CommonMark support')
makedepends=('guile-reader' 'guile-commonmark')
source=("https://files.dthompson.us/haunt/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a45ff725cf1cff841b66510baf072792f139c255266e3ccfcaf1439af56c33a554c124b3b0837922fd10ec40e66d08b3572251dca886b7cc5872877f85bfc17c')

build() {
  cd "$pkgname"-"$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname"-"$pkgver"
  make check
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir/" install
}
