
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libcontemporary
pkgver=6.0.2
pkgrel=1
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/libcontemporary"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'gsettings-qt' 'qcoro-qt6')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libcontemporary/archive/v$pkgver.tar.gz")
sha256sums=('41a47ce840544447b6ad6b681153c49c29eaf03f53705d1e79cde0d42d7760da')

build() {
        cmake -B build -S "$pkgname-$pkgver" \
            -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install "build"
}
