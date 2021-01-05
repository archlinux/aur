# Maintainer: Jürgen Hötzel <juergen@hoetzel.info>
pkgname=prometheus-client-c
pkgver=0.1.3
pkgrel=1
pkgdesc="A Prometheus Client in C"
arch=('i686' 'x86_64')
url="https://github.com/digitalocean/prometheus-client-c"
license=('Apache')
makedepends=("cmake" "gcc")
source=(https://github.com/digitalocean/$pkgname/archive/v${pkgver}.tar.gz)
md5sums=('b40730f096fc60712039c555363b9ef5')
sha256sums=('3a82e302a5bdbbd5f699cf21bee97217c0386b5076d878cab724d5f672ef5092')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  TEST=0 cmake -B build -S prom -DCMAKE_INSTALL_PREFIX:PATH=/usr 
  make -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
