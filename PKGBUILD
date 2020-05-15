# Maintainer: ChungZH <chungzh07 at gmail dot com>
pkgname=notepanda
pkgver=0.0.1
pkgrel=1
pkgdesc="A simple cross-platform notepad. Based on Qt and C++."
arch=('x86_64')
url="https://github.com/ChungZH/notepanda"
license=('MIT')
depends=('syntax-highlighting' 'qt5-base>5.11.0')
makedepends=('cmake' 'git' 'qt5-tools' 'gcc' 'ninja')
provides=('notepanda')
conflicts=('notepanda')
source=("notepanda::git+git://github.com/ChungZH/notepanda")
sha512sums=("SKIP")

build() {
	cd "${srcdir}/notepanda"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release\
        -GNinja
	ninja
}

package() {
	cd "${srcdir}/notepanda/build"
    cmake --install .
}
