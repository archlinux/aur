# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.3.5
pkgrel=1
pkgdesc='Download and install Quest games from ROOKIE Public Mirror'
arch=('x86_64')
url='https://github.com/glaumar/QRookie'
license=(GPL-3.0-or-later)
depends=(hicolor-icon-theme
    qt6-base
    qt6-declarative
    gcc-libs
    qcoro-qt6
    kirigami
    qqc2-breeze-style
    xdg-utils
    p7zip
    android-tools
    android-sdk-build-tools
    android-apktool
    )
makedepends=(cmake extra-cmake-modules)
provides=(QRookie)
source=("https://github.com/glaumar/QRookie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

build() {
    cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target QRookie
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}