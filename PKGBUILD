# Maintainer:  <aaron.l.france@gmail.com>
pkgname=libzookeeper
pkgver=3.4.7
pkgrel=1
pkgdesc="libzookeeper"
arch=('i686' 'x86_64')
url="https://github.com/apache/zookeeper"
license=('Apache')
makedepends=(apache-ant autoconf)
checkdepends=()
optdepends=()
provides=(libzookeper)
source=(https://github.com/apache/zookeeper/archive/release-$pkgver.tar.gz)
md5sums=('6c10db76b92b860c7852343ecdc8372e')

build() {
  cd "$srcdir/zookeeper-release-$pkgver"
  ant compile_jute
  cd src/c
  autoreconf -if
  ./configure --prefix=/usr
}

package() {
  cd "$srcdir/zookeeper-release-$pkgver/src/c/"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
