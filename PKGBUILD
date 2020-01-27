# Maintainer: Aaron Abbott <aabmass@gmail.com>

pkgname=xarexec_fuse
pkgver=19.4.22
pkgrel=1
pkgdesc="Small program to mount a SquashFS xar image, required to execute xar files"
arch=('i686' 'x86_64')
url="https://github.com/facebookincubator/xar"
license=('BSD')
depends=('squashfuse')
makedepends=('cmake')
source=("https://github.com/facebookincubator/xar/archive/$pkgver.tar.gz")
md5sums=('993977a0e718fed66a66237c3bf2d8f0')


build() {
    _cmakebuilddir="$srcdir/xar-$pkgver/build"
    mkdir -p $_cmakebuilddir
    cd $_cmakebuilddir
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"  ..
    make
}

package() {
    make -C $srcdir/xar-$pkgver/build install
}
