# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.2.0
pkgrel=1
pkgdesc='Download and install Quest games from ROOKIE Public Mirror'
arch=('x86_64')
url='https://github.com/glaumar/QRookie'
license=(GPL-3.0-or-later)
depends=(hicolor-icon-theme
    qt6-base
    qt6-declarative
    gcc-libs
    xdg-utils
    p7zip
    android-tools
    qcoro-qt6
    )
makedepends=(cmake)
provides=(qrookie)
source=("https://github.com/glaumar/QRookie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c55665ef36879897a245a739cfea633a0b10d5c2a28a08d8f1e4f59a77f2805')

build() {
    cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target qrookie
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}