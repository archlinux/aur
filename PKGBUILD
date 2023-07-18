
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=libcontemporary
pkgver=6.0.1
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/theCheeseboard/libcontemporary"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-svg' 'gsettings-qt')
makedepends=('git' 'qt6-tools' 'cmake')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/libcontemporary/archive/v$pkgver.tar.gz")
sha256sums=('278445a255c79d403983c4b16ec39c1732341ee54851ef2d19a5d56b40ef1d22')

build() {
        cmake -B build -S "$pkgname-$pkgver" \
            -DCMAKE_INSTALL_PREFIX=/usr
        cmake --build build
}

package() {
        DESTDIR="$pkgdir" cmake --install "build"
}
