pkgname=cproj
pkgver=0.1.2
pkgrel=1
pkgdesc="A lightweight project manager for C and C++"
arch=('x86_64')
url="https://github.com/BradBenJoya/CProj"
license=('MIT')

depends=('cmake' 'ninja' 'git')
makedepends=('gcc')

source=("https://github.com/BradBenJoya/CProj/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
  cmake \
    -S "$srcdir/CProj-$pkgver" \
    -B "$srcdir/build" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release

  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake \
    --install "$srcdir/build"
}
