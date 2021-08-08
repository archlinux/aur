# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f32-backgrounds-fedoradesign
pkgver=32.2.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 32 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('custom')
provides=("f32-backgrounds")
conflicts=("f32-backgrounds")
source=("https://github.com/fedoradesign/backgrounds/releases/download/v32.2.2/f32-backgrounds-32.2.2.tar.xz")
b2sums=('6c965cdfaa672877b1be087edb6de088f90f69027a1645781d19761f49023fde383301cf658f536aab32b1886960e4f9f7e7bf7b3c82ad2cb1fecffd28664ceb')

build() {
    cd f32-backgrounds
    make
}

package() {
    cd f32-backgrounds
    make install DESTDIR="$pkgdir"
    install -Dm644 CC-BY-SA-4.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
