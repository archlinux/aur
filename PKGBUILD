# Maintainer: ber1276 <15134810353@163.com>
pkgname=krunner-chrome-bookmark
pkgver=1.0.0
pkgrel=1
pkgdesc="KRunner plugin to search Google Chrome bookmarks with the bk: prefix"
arch=('x86_64')
url="https://github.com/Ber1276/krunner-chrome-bookmark"
license=('GPL3')
depends=('qt6-base' 'krunner' 'ki18n' 'kcoreaddons' 'kconfig')
makedepends=('cmake' 'extra-cmake-modules' 'gcc')
source=("$pkgname-$pkgver.zip::https://github.com/Ber1276/krunner-chrome-bookmark/archive/refs/tags/v$pkgver.zip")
sha256sums=('d7ba26195588486b737f7fc929d00ad2d00bb68a490924aff8f94910f29f0068')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j"$(nproc)"
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
