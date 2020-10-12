# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.2
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/39facb46d911ad84f4e242ac7044a692960ada96.zip")
sha256sums=('a616391c570fbb870df5725478576c2fb001eac01d4018141f7ea840d4d0fb95')

build() {
    cd $pkgname-39facb46d911ad84f4e242ac7044a692960ada96

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-39facb46d911ad84f4e242ac7044a692960ada96

    cd build
    make install INSTALL_ROOT=$pkgdir
}
