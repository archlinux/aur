# Maintainer: QuantMint quant/mint/@/tutanota./de
pkgname=fastcgi++
_pkgname=fastcgipp
pkgver=3.0
pkgrel=1
pkgdesc="This library is intended as a high-efficiency C++14 api for web development."
arch=('x86_64' 'i686')
license=('LGPL')
depends=()
makedepends=('cmake')
conflicts=('fastcgi++')
url=https://fastcgipp.isatec.ca/
source=("https://github.com/eddic/fastcgipp/archive/3.0.tar.gz")

sha256sums=('SKIP')

prepare() {
		cd $srcdir
		tar -xf "${pkgver}.tar.gz"
    rm -Rf build
    mkdir build
    cd build
    cmake ../"${_pkgname}-${pkgver}" \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
    cd build
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}

test() {
    cd build
    make tests
    make test
}
