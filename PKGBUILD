# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras"
pkgver="1.6"
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/core/${pkgname}"
license=("LGPL3")
depends=("cmake" "python")
source=("https://gitlab.com/tari01/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=("a020e179077617809e7fbec7ec7d099c")

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

