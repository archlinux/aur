pkgname=plasma-classic-wallpapers
pkgver=2.0.1
pkgrel=3
arch=(any)
pkgdesc="A collection of wallpapers from KDE4's artwork ported to work with plasma 6"
url="https://github.com/MartinF99/plasma-classic-wallpapers"
builddepends=(extra-cmake-modules cmake)
source=("https://github.com/MartinF99/plasma-classic-wallpapers/archive/refs/tags/2.0.1.tar.gz")
sha256sums=('e7fb70bb5af2601857dd5b1f22500c10b5b73f7319a431954d24e200ea088f68')
license=('LGPL-3.0')
build(){
    cmake -B build -S $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    DESTDIR=$pkgdir cmake --install $srcdir/build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.LESSER"
}
