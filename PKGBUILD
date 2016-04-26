# Maintainer: Chan Beom Park <cbpark@gmail.com>

_pkgrname=ThePEG
pkgname=thepeg
pkgver=2.0.1
pkgrel=1
pkgdesc="Toolkit for High Energy Physics Event Generation"
arch=("i686" "x86_64")
url="http://thepeg.hepforge.org"
license=('GPL')
depends=("gsl" "lhapdf" "hepmc" "rivet" "zlib" "fastjet" "boost")
source=("http://www.hepforge.org/archive/thepeg/${_pkgrname}-$pkgver.tar.bz2")
sha256sums=('ec284abdc82ceaf10a8736f908e7955f49f872b79aaa62d22aa33bc5c7679bdb')

build() {
  cd "${_pkgrname}-$pkgver"
  ./configure --prefix=/usr --with-lhapdf=/usr --with-fastjet=/usr
  make
}

package() {
  cd "${_pkgrname}-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
