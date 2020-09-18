# Maintainer: Gabriel Rauter <rauter.gabriel@gmail.com>

pkgname=kdiskmark
pkgver=1.6.2
pkgrel=1
pkgdesc="HDD and SSD benchmark tool with a very friendly graphical user interface"
arch=('i686' 'x86_64')
url="https://github.com/JonMagon/KDiskMark"
license=(GPL3)
depends=(qt5-base fio libaio hicolor-icon-theme)
makedepends=(git cmake extra-cmake-modules qt5-tools)
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/JonMagon/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
  DESTDIR="$pkgdir" make -C build install
}
