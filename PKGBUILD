# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
pkgname="openbangla-keyboard"
pkgver="1.5.0"
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
sha256sums=('863287231c782794a9f0da9c580ef4ff311f46849eb18dbbd1038c2c71e32829')
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
