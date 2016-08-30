# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=cpp-hocon
pkgver=0.1.2
pkgrel=1
pkgdesc="C++ port of the Typesafe Config library"
arch=('i686' 'x86_64')
url="https://github.com/puppetlabs/cpp-hocon"
license=('APACHE')
depends=('leatherman')
makedepends=('boost' 'cmake')
source=($pkgname-$pkgver.tar.gz::https://github.com/puppetlabs/cpp-hocon/archive/$pkgver.tar.gz)
md5sums=('8db77c4ba4bb44047450c19ff43b3f51')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr

  make
}

check() {
  cd $pkgname-$pkgver

  make test
}

package() {
  cd $pkgname-$pkgver

  make install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
