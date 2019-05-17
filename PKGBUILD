# Forked from guile-json 1.2.0 PKGBUILD

# Maintainer: lantw44
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json1
_pkgname=guile-json
pkgver=1.3.2
pkgrel=1
pkgdesc='JSON module for Guile (Version 1)'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("https://download.savannah.gnu.org/releases/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('33f94ea73c478faeca0d56c6d4c12591cb18956476da314df9d1e464c2fade54')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
