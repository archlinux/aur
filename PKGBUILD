# Maintainer: Brent Carmer <bcarmer@gmail.com>
pkgname=fplll

pkgver=v4.0
pkgver() {
      cd "$pkgname"
        git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
    }

pkgrel=1
pkgdesc="A library for LLL-reducing euclidean lattices."
url="https://github.com/dstehle/fplll"
arch=('x86_64' 'i686')
license=('LGPL')
depends=(
  'gmp>=4.2.0'
  'mpfr>=2.3.0'
)
makedepends=(
  'git'
  'autoconf>=2.61'
  'automake>=1.6.0'
  'libtool>=1.4.2'
)
optdepends=()
conflicts=()
replaces=()
backup=()
conflicts=()
md5sums=('SKIP')

source=("git://github.com/dstehle/fplll.git")

build() {
    cd $srcdir/${pkgname}
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
  cd $srcdir/$pkgname 
  make DESTDIR="$pkgdir/" install
}
