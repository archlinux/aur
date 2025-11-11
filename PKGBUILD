# Maintainer: Connor Chang <connorc0627@gmail.com>
pkgname=eprosima-fast-dds-python
pkgver=2.4.0
pkgrel=1
pkgdesc="Python binding for the eProsima Fast DDS C++ library"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS-python"
license=('Apache')
depends=('eprosima-fast-dds' 'python')
makedepends=(
    'cmake'
    'swig'
    # setuptools needed for distutils python package
    'python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=('python-fastdds')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eProsima/Fast-DDS-python/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('636581bddf3e915a3799e068c4575d5a43f44dca76189e1b8375fd7b4abd366c')
validpgpkeys=()
build() {
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -S Fast-DDS-python-$pkgver/fastdds_python
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
