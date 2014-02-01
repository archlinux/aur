# Maintainer: Yaron de Leeuw <jdlmail at gmail >
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

# Contributor: Matz Radloff <matzradloff@gmx.de>
# Contributor: Jan Willies <jan@willies.info>
# Contributor: Carlos Franke <carlos_franke at lemtank dot de>

pkgname="cxxtools"
pkgver="2.2.1"
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
md5sums=('aab00068ae5237435b37ac86f2ac7576')
sha512sums=('b6dc3f63c39fbbc35af973eea668a44d30673140c72bfa7efbdc21a71816be2983e85312b9213264d4f5162c3e420eedb41974bacb7fe8176f2a069b6f8f6f7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
    
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
