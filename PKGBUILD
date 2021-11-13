# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: Devin J. Pohly <djpohly+arch@gmail.com>

pkgname=libsbsms
pkgver=2.3.0
pkgrel=1
pkgdesc='Library for time stretching and pitch scaling of audio'
arch=('x86_64')
url='https://github.com/claytonotey/libsbsms'
license=('GPL')
depends=('gcc-libs')
options=('!staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/claytonotey/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('e5b544c2bdbaa2169236987c7a043838c8d1761b25280c476d7a32656d482c6485cb33f579ea9d1ce586ec7b2913ed8fdcf1abe5c7cc8b9e4eef9ce87de54627')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
