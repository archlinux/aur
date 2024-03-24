# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras"
pkgver="1.7"
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/development/core/${pkgname}"
license=("LGPL-3.0-or-later")
depends=("cmake" "python" "bash")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/ubports/development/core/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=("936fa4a322990eb72aed856bfc793d33")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    DESTDIR=${pkgdir} cmake --install build
}

