# Maintainer:  Julio Campagnolo <juliocampagnolo@gmail.com>

pkgname=astromatic-stuff
_pkgname=stuff
pkgver=1.26.0
pkgrel=1
pkgdesc="Stuff is a program that simulates “perfect” astronomical catalogues (build from source)"
url="http://www.astromatic.net/software/stuff"
arch=('x86_64')
license=('GPL')
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(https://www.astromatic.net/download/stuff/stuff-${pkgver}.tar.gz)
sha1sums=('53a9c860f1b7a44fec9aacdd8f6d404bf4bcde95')

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

