# Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Todd Musall <tmusall@comcast.net>

pkgname=gtubeclock
pkgver=0.9.1
pkgrel=3
pkgdesc="A nixie tube style clock for X."
arch=('i686' 'x86_64')
url="http://www.bonnyswan.com/gtubeclock/"
license="GPL"
depends=('libgnomeui')
makedepends=('pkgconfig')
source=(http://www.bonnyswan.com/$pkgname/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('94dffc6431e29cc25ae68f4318c33e05')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
