# Maintainer: sol56 <sol56@cryptolab.net>
pkgname=elfix
pkgver=0.9.2
pkgrel=1
pkgdesc="paxctl-ng and revdep-pax from gentoo git"
arch=('i686' 'x86_64')
url="https://cgit.gentoo.org/proj/elfix.git"
license=('GPL3')
depends=('attr' 
		 'libelf')
makedepends=('autoconf'
             'automake'
             'binutils'
             'expect'
             'gcc'
             'libtool'
             'make'
             'pkg-config')
provides=('paxctl-ng')
conflicts=('paxctl-ng')
changelog=
source=(https://cgit.gentoo.org/proj/elfix.git/snapshot/$pkgname-$pkgver.tar.gz)
md5sums=('8ae0c4afe4b109f287b0b3338ab843bc')
sha256sums=('daa4f61e96613f45013f28ab7ec569f6e36b70ee9b9e4696f65663419f6b12e2')
sha512sums=('1d1139d57d795cc093fc634440d71b3d5d56d3e6994d2d869de6253863b8100a26d11a7b356ad08a14e2307eea8f7fa50cec5042dfbb9a0de25fb5a0d1489156')


build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}