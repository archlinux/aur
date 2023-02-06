# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=libfyaml
pkgver=0.8
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=('x86_64')
url='https://pantoniou.github.io/libfyaml'
license=('MIT')
source=(https://github.com/pantoniou/libfyaml/releases/download/v${pkgver}/libfyaml-${pkgver}.tar.gz)

sha512sums=('da86055a9b4afd471fa58ca569df05119e3b0982a5d28666625a80c4a7b69c6a3a09aa553c2b88de35f204912b2572cbf5d6c949f09d65e44f785da86f468a2c')

build() {
  cd "$srcdir"/libfyaml-${pkgver}
  ./bootstrap.sh
  ./configure --prefix=/usr
  make
}


check() {
  cd "$srcdir"/libfyaml-${pkgver}
  make check
}


package() {
  cd "$srcdir"/libfyaml-${pkgver}
  make DESTDIR="$pkgdir/" install || return 1
}
