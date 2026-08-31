# Maintainer: Michal Babik <michal.babik@protonmail.com>

pkgname=sfrename
pkgver=1.3.0
pkgrel=1
pkgdesc="Program for renaming files and directories"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.nongnu.org/small-file-renamer/"
license=('GPL3')
depends=('gtk3>=3.22.0')
makedepends=('cmake' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mi-bb/sfrename/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e2dda90797ee75b7f232773a1e593f488e19f628370cb0ceedbca84cd7b6856a')
build() {
        cd "$srcdir/$pkgname-$pkgver"
        cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
        cmake --build build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        DESTDIR="$pkgdir" cmake --install build
}
