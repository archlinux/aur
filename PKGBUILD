# Maintainer: Robert Tari <robert at tari dot in>

pkgname=cmake-extras
pkgver=1.3
pkgrel=3
pkgdesc='Extra CMake utility modules'
arch=('any')
url='https://launchpad.net/cmake-extras'
license=('LGPL3')
depends=('cmake>=3.1' 'python')
makedepends=('cmake')
source=("${pkgname}::http://archive.ubuntu.com/ubuntu/pool/universe/c/cmake-extras/cmake-extras_1.3+17.04.20170310.orig.tar.gz" '0001_73_72.patch' '0002_74_73.patch' '0003_75_74.patch' '1002_fix-googletest-1_8_1-1.patch')
sha256sums=('26e2a45a91065493a4c1999086a1cbaa85fb85dc8bd47b119abc3bc3848f853b' 'c573a9e4f76682cee5145d625c63ae08876a9b9b2f5104567b02b3f2c02c33a4' 'f87a8e6e5d0b1d0e020fe0cf195b1584a3f60d7800b0b17426809c0ad4057a32' '094d83a32a782f6c4f370c263b1f06b5d3717110b7ef7f8342d2caa3143a91b2' '9d06f076e038f4ecf9d467db1e9ee72a14ee7c6828263b439d436ab4131a3967')

prepare()
{
    cd ${srcdir}

    patch -Np1 -i "${srcdir}/0001_73_72.patch"
    patch -Np1 -i "${srcdir}/0002_74_73.patch"
    patch -Np1 -i "${srcdir}/0003_75_74.patch"
    patch -Np1 -i "${srcdir}/1002_fix-googletest-1_8_1-1.patch"
}

build()
{
    cd ${srcdir}
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package()
{
    cd ${srcdir}
    make DESTDIR="${pkgdir}" install
}
