# Maintainer: Jürgen Hötzel <juergen@hoetzel.info>
pkgname=prometheus-client-c
pkgver=0.1.1
pkgrel=1
pkgdesc="A Prometheus Client in C"
arch=('i686' 'x86_64')
url="https://github.com/digitalocean/prometheus-client-c"
license=('Apache')
makedepends=("cmake" "gcc")
source=(https://github.com/digitalocean/$pkgname/archive/v${pkgver}.tar.gz)
md5sums=('f0916563f7f0f43a278f720f04b214c9')
sha256sums=('8d6a4eec4492c9fe85f85c0ccd46e1e7fcfb445766b3686681693fa70f71058d')

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
