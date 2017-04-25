# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-psfex
_pkgname=psfex
pkgver=3.17.1
pkgrel=1
pkgdesc="extracts models of the PSF from FITS images processed with sextractor"
url="http://www.astromatic.net/software/psfex"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'atlas-lapack' 'astromatic-sextractor')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(http://www.astromatic.net/download/psfex/psfex-${pkgver}.tar.gz)
sha1sums=('366a7bdb2609fd0453d712aab3d11fdf95604c60')

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

