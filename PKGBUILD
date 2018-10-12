# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
pkgname="openbangla-keyboard"
pkgver="1.5.1"
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="http://openbangla.github.io"
license=('GPL3')
depends=('ibus' 'qt5-base')
makedepends=('cmake')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenBangla/OpenBangla-Keyboard/archive/$pkgver.tar.gz")
sha256sums=('154904f1d081b05dd8921ae6662af2645d0180af4b1b29e588b62d07f05e9d91')
build() {
    cd "$srcdir/OpenBangla-Keyboard-$pkgver"
    if [[ -d build ]]; then rm -rf build; fi
    mkdir build && cd build
    cmake ..
    make
}
package() {
    cd "$srcdir/OpenBangla-Keyboard-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
