pkgname=libcsptr-git
pkgver=v2.0.1.r0.gff405f2
pkgrel=1
pkgdesc="A smart pointers library for the C programming language"
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/libcsptr.git"
license=('MIT')
makedepends=('git')
provides=('libcsptr')
conflicts=('libcsptr')

source=("$pkgname"::"git://github.com/Snaipe/libcsptr.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="$pkgdir/" install
}
