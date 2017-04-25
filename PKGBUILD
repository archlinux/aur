# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.19.5
pkgrel=1
pkgdesc="builds a catalogue of objects from an astronomical image (build from source)"
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'atlas-lapack')
makedepends=()
provides=()
conflicts=('sextractor-bin')
replaces=('sextractor-bin')
backup=()
source=(http://www.astromatic.net/download/sextractor/sextractor-${pkgver}.tar.gz)
sha1sums=('43a48391b90b915b1c256b68c29c2276bee8621d')

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

