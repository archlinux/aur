# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.2.1
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
makedepends=(cmake)
provides=(qrookie)
source=("https://github.com/glaumar/QRookie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0f036d7dc3b9408a9bdcd438316e7d6edc98a9ef3fa9fca8dbf42000917b628')

build() {
    cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build --target qrookie
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}