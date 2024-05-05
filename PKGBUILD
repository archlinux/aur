# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.2.3
pkgrel=2
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
    kirigami
    qqc2-breeze-style
    )
makedepends=(cmake extra-cmake-modules)
provides=(qrookie)
source=("https://github.com/glaumar/QRookie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3897c54e2a14cc6c9b221a502e56ea3ae04da9d611a21422cd806fcde9834d5b')

build() {
    cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target qrookie
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}