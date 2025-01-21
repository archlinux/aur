# Maintainer: Glaumar git@geekgo.tech

pkgname=qrookie-vrp
pkgver=0.4.2
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
sha256sums=('e837e63a357c5ba08378fc5459ef966cc0617036e90ef2cf8717424a017c53c5')

build() {
  cmake -B build -S "QRookie-${pkgver}" -DCMAKE_BUILD_TYPE='Release' -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build --target QRookie
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}