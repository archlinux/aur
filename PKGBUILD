# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgname=ThePEG
pkgname=thepeg
pkgver=2.1.5
pkgrel=2
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "fastjet" "lhapdf" "hepmc" "zlib" "boost")
optdepends=("rivet")
source=("http://www.hepforge.org/archive/${pkgname}/${_pkgname}-${pkgver}.tar.bz2")
sha512sums=('0a89cff591998049d9e812db69be8751f2f5daa9f7cf7489ef418f598adcb50f50386127601a910aabff67ce36aa104100d691990ab55d913858eae68d708570')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
