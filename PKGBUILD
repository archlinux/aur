# Maintainer: Yaron de Leeuw <jdlmail at gmail >
# Contributor: Matz Radloff <matzradloff@gmx.de>
# Contributor: Jan Willies <jan@willies.info>
# Contributor: Carlos Franke <carlos_franke at lemtank dot de>

pkgname="cxxtools"
pkgver="2.2"
pkgrel="1"
pkgdesc="A collection of general-purpose C++ classes"
url="http://www.tntnet.org/cxxtools.html"
license=("LGPL")
arch=("i686" "x86_64")
source=(http://www.tntnet.org/download/$pkgname-$pkgver.tar.gz)
depends=('gcc-libs')
optdepends=(
  'bash: for running cxxtools-config'
)
md5sums=('9364b1221098c20f32fedf1338a56e56')
sha512sums=('d5eb004469b53e0d7eab3efefd756660094a2a6db2150b509f9e9442bd932657ad37d0cb06788c8944a3d9c4c897b3580e1b62e860cfbc30a8b4e912f22e69d3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
    
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
