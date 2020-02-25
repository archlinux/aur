# Maintainer: Lukas Rose <public@lrose.de>
pkgname=boost171
pkgver=1.71.0
pkgrel=2
pkgdesc="Free peer-reviewed portable C++ source libraries"
arch=('i686' 'x86_64')
url="https://www.boost.org/"
license=('Boost Software License - Version 1.0')
optdepends=('python: for python bindings' 'python2: for python2 bindings')
makedepends=('gzip' 'icu' 'openmpi' 'python' 'python-numpy' 'zlib' 'zstd')
conflicts=('boost' 'boost-libs')
provides=('boost-libs')
source=("https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz")
sha256sums=('96b34f7468f26a141f6020efb813f1a2f3dfb9797ecf76a7d7cbd843cc95f5bd')

prepare() {
  cd "boost_1_71_0"
  ./bootstrap.sh
}

build() {
  cd "boost_1_71_0"
  ./b2
}

package() {
  cd "boost_1_71_0"
  mkdir -p "$pkgdir/usr/include/"
  mkdir -p "$pkgdir/usr/lib/"
  cp -r boost "$pkgdir/usr/include/"
  cp -r stage/lib/* "$pkgdir/usr/lib/"
}
