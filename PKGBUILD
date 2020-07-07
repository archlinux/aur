# Maintainer: Fabrice Corraire <antidote1911@gmail.com>

pkgname=arsenic
pkgver=3.5.2
pkgrel=1
pkgdesc="Qt5 app for encrypt files and text with triple encryption"
arch=('x86_64')
url="https://github.com/Antidote1911/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Antidote1911/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2540179618C9AEEE401057B0FA020DBA15702BE4276A72A918F2CAFDDB71210C')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"    
    make INSTALL_ROOT="${pkgdir}/" install
}
