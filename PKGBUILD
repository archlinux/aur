# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.2.2
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
    kirigami
    )
makedepends=(cmake extra-cmake-modules)
provides=(qrookie)
source=("https://github.com/glaumar/QRookie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c169a67015829ee805fea7aa6644f16362aa4c1a898cdee55f93dd5b1c3e982a')

build() {
    cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target qrookie
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}