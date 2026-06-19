pkgname=plasma-classic-wallpapers
pkgver=2.1
pkgrel=1
arch=(any)
pkgdesc="A collection of wallpapers from KDE4's artwork ported to work with plasma 6"
url="https://github.com/MartinF99/plasma-classic-wallpapers"
builddepends=(extra-cmake-modules cmake)
source=("https://github.com/MartinF99/plasma-classic-wallpapers/archive/refs/tags/2.1.tar.gz")
sha256sums=('8d35466eb29d8dd67db160b1c1177059c649173cc91f61fa0ee58adb80f79d88')
license=('LGPL-3.0')
build(){
    cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    DESTDIR=$pkgdir cmake --install $srcdir/build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER"
}
