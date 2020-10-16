# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
# Co-Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: github OpenBangla/OpenBangla-keyboard
pkgname="openbangla-keyboard"
pkgver="2.0.0"
pkgrel=2
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="http://openbangla.github.io"
license=('GPL3')
depends=('ibus' 'qt5-base')
makedepends=('cmake' 'rust')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenBangla/OpenBangla-keyboard/archive/$pkgver.tar.gz")
sha256sums=('29e8cfbdc913832ede040adcf623b59cc47e92e12d5cfd995dd40cf5d6906b6a')
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
