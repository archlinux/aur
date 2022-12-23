pkgname=gau2grid
pkgver=2.0.7
pkgrel=1
pkgdesc="Fast computation of a gaussian and its derivative on a grid."
arch=('x86_64')
url="https://github.com/dgasmith/gau2grid"
license=(BSD)
makedepends=(cmake)
provides=(gau2grid)
source=($pkgname-$pkgver.tar.gz::https://github.com/dgasmith/gau2grid/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('66e7205646e1e3685e5dd4eea8281fc92b0b8b45ce97ae24b72a09e15a3fd62f')

build(){
    cd $pkgname-$pkgver
    cmake -H. -Bbuild
    cmake --build build -j`getconf _NPROCESSORS_ONLN`
}

package(){
    cd $pkgname-$pkgver
    cmake --install build --prefix $pkgdir/usr/
    mv $pkgdir/usr/share/cmake/gau2grid $pkgdir/usr/share
}