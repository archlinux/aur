# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Thulinma <jaron@vietors.com>
pkgname=qt6-jdenticon
_pkgname=qt-jdenticon
pkgdesc="Qt6 / C++14 Port of Jdenticon"
pkgver=0.3.1
pkgrel=1
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Nheko-Reborn/qt-jdenticon"
depends=('qt6-base')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nheko-Reborn/qt-jdenticon/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1556db9843b9f5e06989ac87250ea1812e17f3d1cbf7dcfa8671b0c29712df496fabdf169364c51a261f020aad49c92b9131db872f8918c65987f6202d96e68c')

build() {
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}
package() {
  DESTDIR="$pkgdir" cmake --install build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${_pkgname}-${pkgver}/LICENSE"
}

