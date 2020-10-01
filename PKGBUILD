# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.15
pkgrel=8
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/3c94c6dbb3c6b0d814e08d4057f268dea3a0a936.zip")
sha256sums=('f3307d9c5556ff51a7474b0eff5d6f3657bafe7b4f7f9576da0578f388455ec6')

build() {
    cd $pkgname-3c94c6dbb3c6b0d814e08d4057f268dea3a0a936

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-3c94c6dbb3c6b0d814e08d4057f268dea3a0a936

    cd build
    make install INSTALL_ROOT=$pkgdir
}
