# Maintainer: Moony727 <xmoony609@gmail.com>
pkgname=brawltag
pkgver=1.0.0
pkgrel=1
pkgdesc="Native C++/Libadwaita tool for Brawl Stars Tag/ID conversion"
arch=('x86_64')
url="https://github.com/Moony727/BrawlTag"
license=('GPL3')
depends=('libadwaita' 'gtk4')
makedepends=('cmake' 'gcc' 'glib2')
source=("${pkgname}::git+https://github.com/Moony727/BrawlTag.git")
sha256sums=('SKIP')

build() {
    cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
