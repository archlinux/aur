# Maintainer: Emil Edholm <emil@edholm.it>

_pkgname=honggfuzz
pkgname=${_pkgname}-git
pkgver=0.7.r119.g33cce5d
pkgrel=1
pkgdesc="A general-purpose, easy-to-use fuzzer with interesting analysis options"
arch=('i686' 'x86_64')
url="http://google.github.io/honggfuzz/"
license=('Apache')
depends=('binutils'
         'libunwind')
makedepends=()
optdepends=()
conflicts=()
provides=(${_pkgname})
#install=''
source=('git://github.com/google/honggfuzz')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm755 honggfuzz "$pkgdir/usr/bin/honggfuzz"
}
