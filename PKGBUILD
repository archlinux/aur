# Maintainer: Eisuke Kawashima <e DOT kawaschima+arch AT gmail DOT com>
# Contributor: Wu Junyu <wu DOT junyu DOT aur AT outlook DOT com>

pkgname=gau2grid
pkgver=2.0.8
pkgrel=1
pkgdesc='Fast computation of a gaussian and its derivative on a grid.'
arch=('x86_64')
url='https://github.com/dgasmith/gau2grid'
license=(BSD-3-Clause)
makedepends=(cmake python python-numpy python-setuptools)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c5f445344a465c1d9afc6516544dc4a2fba588af7ba0f1ac1a6b538260f0cd96')

build(){
    cd $pkgname-$pkgver
    cmake -S. -Bbuild
    cmake --build build
}

package(){
    cd "$pkgname-$pkgver"
    cmake --install build --prefix "$pkgdir/usr/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # mv $pkgdir/usr/share/cmake/gau2grid $pkgdir/usr/share
    # sed -r -i "s:\\${_IMPORT_PREFIX}/include:\\${_IMPORT_PREFIX}/usr/include:g" $pkgdir/usr/share/gau2gridTargets.cmake
}
