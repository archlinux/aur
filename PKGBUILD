# Maintainer: gilcu3 <gilcu3 at gmail dot com>

_pkgname=conf2struct
pkgname=$_pkgname-git
pkgver=1.5.r0.g6bc9eed
pkgrel=1
pkgdesc="conf2struct takes a configuration file that describes a configuration file in the libconfig format, and generates a C parser that will read a configuration file directly into a C structure"
arch=('i686' 'x86_64')
url='https://www.rutschle.net/tech/conf2struct/README.html'
license=('GPL2')
depends=('libconfig' 'perl' 'perl-conf-libconfig')
makedepends=('git' 'libconfig' 'perl-conf-libconfig' 'pcre2' 'perl')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::"git+https://github.com/yrutschle/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
}

build() {
  cd $pkgname
  make
}

package() {
  # Executables
  install -Dm755 $srcdir/$pkgname/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  # install -Dm755 $srcdir/$pkgname/confcheck "$pkgdir/usr/bin/confcheck"
}

