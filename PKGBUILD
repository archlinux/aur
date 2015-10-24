# Maintainer: yourname <yourmail>
pkgname=aquila-git
pkgver=3.0
pkgrel=1
pkgdesc="Digital Signal Processing library"
arch=('any')
url="http://aquila-dsp.org/"
makedepends=('cmake' 'gcc')
source=("git+https://github.com/zsiciarz/aquila/")
md5sums=('SKIP')


build() { 
    mkdir -p build && pushd build
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ../aquila
    make
    popd
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
