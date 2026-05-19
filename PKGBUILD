# Maintainer: smiley <me@smileyhq.pro>
pkgname=pinentry-hypr
pkgver=0.1.0
pkgrel=1
pkgdesc="A Hyprland-native GnuPG pinentry using Qt6/QML/hyprutils"
arch=('x86_64')
url="https://github.com/AuthenticSm1les/pinentry-hypr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'hyprutils' 'hyprland-qt-support' 'libsecret')
makedepends=('cmake')
provides=('pinentry-hypr')
conflicts=('pinentry-hypr-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('d243280f6068b0c89bf34fadbc845e2211b15af7d3731fd72abe3e582dbe1bb4')

build() {
  cmake -B build -S "$srcdir/pinentry-hypr-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
