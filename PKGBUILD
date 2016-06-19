# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgrname=ThePEG
pkgname=thepeg
pkgver=2.0.2
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("i686" "x86_64")
url="http://thepeg.hepforge.org"
license=('GPL2')
depends=("gsl" "lhapdf" "hepmc" "rivet" "zlib" "fastjet" "boost")
source=("http://www.hepforge.org/archive/thepeg/${_pkgrname}-$pkgver.tar.bz2")
sha256sums=('d4249e019543d5c7520733292d2edfb0bdd9733177200a63837781ed6194789b')

build() {
  cd "${_pkgrname}-$pkgver"
  ./configure --prefix=/usr --with-lhapdf=/usr --with-fastjet=/usr
  make
}

package() {
  cd "${_pkgrname}-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
