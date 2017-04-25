# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-scamp
_pkgname=scamp
pkgver=2.0.4
pkgrel=1
pkgdesc="computes astrometric and photometric solutions for any arbitrary sequence of FITS images in a completely automatic way."
url="http://www.astromatic.net/software/scamp"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'atlas-lapack' 'astromatic-sextractor' 'cdsclient')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.astromatic.net/download/scamp/scamp-${pkgver}.tar.gz)
sha1sums=('0c81ba051c17adda3b779d06059cec86ab1912dd')

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

