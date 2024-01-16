
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libcontemporary
pkgver=6.1
pkgrel=1
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/libcontemporary"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'gsettings-qt' 'qcoro-qt6')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libcontemporary/archive/v$pkgver.tar.gz")
sha256sums=('a9b8ca64237f85c2e2cad0f46ecbe2cc4caf605ff5296bb562e629d9d852be82')

build() {
        cmake -B build -S "$pkgname-$pkgver" \
            -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install "build"
}
