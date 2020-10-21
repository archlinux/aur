# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.6
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/abb2876513900d7b576b70da2344e7fa0df8038a.zip")
sha256sums=('1e067fad4d09a186f1cb82e4b4925af85488381e872b07a3658ac0cbdc2e477b')

build() {
    cd $pkgname-abb2876513900d7b576b70da2344e7fa0df8038a

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-abb2876513900d7b576b70da2344e7fa0df8038a

    cd build
    make install INSTALL_ROOT=$pkgdir
}
