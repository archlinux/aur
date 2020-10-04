# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.17
pkgrel=2
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/6d7dad6c4a3df6adbad75b1683167a4e7b43d43b.zip")
sha256sums=('f5db5e215b2be9ecdfe7eb8f5f68da782a7e8c7eebf3f800cda51248b70737ea')

build() {
    cd $pkgname-6d7dad6c4a3df6adbad75b1683167a4e7b43d43b

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-6d7dad6c4a3df6adbad75b1683167a4e7b43d43b

    cd build
    make install INSTALL_ROOT=$pkgdir
}
