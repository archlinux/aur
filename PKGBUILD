# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=libfyaml
pkgver=0.7.12
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=('x86_64')
url='https://pantoniou.github.io/libfyaml'
license=('MIT')
source=(https://github.com/pantoniou/libfyaml/releases/download/v${pkgver}/libfyaml-${pkgver}.tar.gz)

sha256sums=('485342c6920e9fdc2addfe75e5c3e0381793f18b339ab7393c1b6edf78bf8ca8')

build() {
  cd "$srcdir"/libfyaml-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir"/libfyaml-${pkgver}
  make DESTDIR="$pkgdir/" install || return 1
}
