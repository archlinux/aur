# Maintainer: Fabrice Corraire <antidote1911@gmail.com>

pkgname=arsenic
pkgver=2.7
pkgrel=1
pkgdesc="Qt5 app for encrypt files and text with triple encryption"
arch=('x86_64')
url="https://github.com/Antidote1911/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Antidote1911/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('C6F4C2E8EFAFAA6F228C17CEF05C151B3B99D27930A3A084DB8722F88E1AEC19')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"    
    make INSTALL_ROOT="${pkgdir}/" install
}
