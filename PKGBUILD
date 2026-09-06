pkgname=plasma-classic-wallpapers
pkgver=2.1.1
pkgrel=1
arch=(any)
pkgdesc="A collection of wallpapers from KDE4's artwork ported to work with plasma 6"
url="https://github.com/MartinF99/plasma-classic-wallpapers"
builddepends=(extra-cmake-modules cmake)
source=("https://github.com/MartinF99/plasma-classic-wallpapers/archive/refs/tags/2.1.1.tar.gz")
sha256sums=('a913377a71111b171cbb370dfed9fc4741e079ad64ef3b3446efa16b0ec244d0')
license=('LGPL-3.0')
build(){
    cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    DESTDIR=$pkgdir cmake --install $srcdir/build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER"
}
