# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.15
pkgrel=6
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/30566eed46f5e1d661b82adbd69ebd08fb79a63c.zip")
sha256sums=('ddbc517e86804a7e568f1a249ebcf223142bab5bbe29939f0ddc06481c99a367')

build() {
    cd $pkgname-30566eed46f5e1d661b82adbd69ebd08fb79a63c

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-30566eed46f5e1d661b82adbd69ebd08fb79a63c

    cd build
    make install INSTALL_ROOT=$pkgdir
}
