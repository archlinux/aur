# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.14
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/59480f86981a79772450195a20ee6e2102f5916f.zip")
sha256sums=('effc20d807600da65130e1b6f373a504525ee4a8611ff0609b49c42810b39533')

build() {
    cd $pkgname-59480f86981a79772450195a20ee6e2102f5916f

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-59480f86981a79772450195a20ee6e2102f5916f

    cd build
    make install INSTALL_ROOT=$pkgdir
}
