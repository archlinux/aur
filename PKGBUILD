pkgname=kdecrypt
pkgver=1.0.0
pkgrel=1
pkgdesc="PGP/GPG file encryption and decryption manager for KDE Plasma"
arch=('x86_64')
url="https://github.com/Guid-Lab/kdecrypt"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'kcoreaddons'
    'ki18n'
    'kxmlgui'
    'kwidgetsaddons'
    'kwallet'
    'kdbusaddons'
    'kwindowsystem'
    'openssl'
    'gnupg'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-tools'
    'kdoctools'
    'gettext'
)
optdepends=(
    'khelpcenter: for the built-in handbook'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Guid-Lab/kdecrypt/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
