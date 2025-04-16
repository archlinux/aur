# Maintainer: Robert Tari <robert at tari dot in>

pkgname="cmake-extras"
pkgver="1.8"
pkgrel=1
pkgdesc="A collection of add-ons for the CMake build tool"
arch=("any")
url="https://gitlab.com/ubports/development/core/${pkgname}"
license=("LGPL-3.0-or-later")
makedepends=("cmake")
depends=("python" "bash")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/ubports/development/core/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=("7d4527a7ec0cd478d29f19ecee916974")

build()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package()
{
    cd ${srcdir}/${pkgname}-${pkgver}
    DESTDIR=${pkgdir} cmake --install build
}

