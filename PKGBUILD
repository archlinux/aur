# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=19
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz-qt6')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/4b96bccaa9a07cca38cffeab70f25b825e1a52f7.zip")
sha256sums=('2433bc73617916a79e7a7b45400ba306431075534e6c39f74ed31d0936a621eb')

build() {
    cd mpz-4b96bccaa9a07cca38cffeab70f25b825e1a52f7

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd mpz-4b96bccaa9a07cca38cffeab70f25b825e1a52f7

    cd build
    make install INSTALL_ROOT=$pkgdir
}
