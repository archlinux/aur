# Maintainer:  Julio Campagnolo <juliocampagnolo@gmail.com>

pkgname=astromatic-skymaker
_pkgname=skymaker
pkgver=3.10.5
pkgrel=1
pkgdesc="SkyMaker is a program that simulates astronomical images (build from source)"
url="http://www.astromatic.net/software/skymaker"
arch=('x86_64')
license=('GPL')
depends=('fftw')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=(https://www.astromatic.net/download/skymaker/skymaker-${pkgver}.tar.gz)
sha1sums=('0e11eb66f5d23f12cf6dc967ef4ade5328a662ca')

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

