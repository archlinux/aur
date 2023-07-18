
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libcontemporary
pkgver=6.0.1
pkgrel=1
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/libcontemporary"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'gsettings-qt' 'qcoro-qt6')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libcontemporary/archive/v$pkgver.tar.gz")
sha256sums=('11a70849f1ba7c585acec3a88475c661eab93ce43ce4d85ff839612e5fadcde5')

build() {
        cmake -B build -S "$pkgname-$pkgver" \
            -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install "build"
}
