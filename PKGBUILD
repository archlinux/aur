# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.17
pkgrel=1
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/cf148c99115932e23d81a12e29e08128275764dd.zip")
sha256sums=('396394ab9a1c229f028ac7c54d2d61f9ed6f4dae9de15ba514aaeaec035ad3bc')

build() {
    cd $pkgname-cf148c99115932e23d81a12e29e08128275764dd

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-cf148c99115932e23d81a12e29e08128275764dd

    cd build
    make install INSTALL_ROOT=$pkgdir
}
