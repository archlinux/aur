# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras"
pkgver="1.6"
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/core/${pkgname}"
license=("LGPL3")
depends=("cmake" "python")
source=("https://gitlab.com/ubports/core/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=("3f4a4f785cf34e6d201422e00e9e3ffa")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

