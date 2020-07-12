# Maintainer: Anton Karmanov <starcom24@gmail.com>

pkgname=geany-jedi-complete
pkgver=3541deb
pkgrel=1
pkgdesc="A Geany plugin that provides Python code completion using jedi."
arch=("any")
url="https://github.com/notetau/geany-jedi-complete"
license=('GPL2')
depends=('geany' 'python-jedi' 'curl')
makedepends=('gtk2')
checkdepends=()
optdepends=('python2-jedi')
source=("https://github.com/notetau/geany-jedi-complete/archive/$pkgver.tar.gz")
md5sums=('052ce030a2b71bc8be990616ea7d0027')
validpgpkeys=()

build() {
  cd $srcdir/$(tar -tf $pkgver.tar.gz | head -n 1)
  make
}

package() {
  mkdir -p $pkgdir$(pkg-config --variable=libdir geany)/geany
  cd $srcdir/$(tar -tf $pkgver.tar.gz | head -n 1)
  make PREFIX="$pkgdir$(pkg-config --variable=libdir geany)/geany" install
}
