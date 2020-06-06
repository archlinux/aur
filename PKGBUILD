# Maintainer: Fabrice Corraire <antidote1911@gmail.com>

pkgname=arsenic
pkgver=3.0.0
pkgrel=2
pkgdesc="Qt5 app for encrypt files and text with triple encryption"
arch=('x86_64')
url="https://github.com/Antidote1911/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Antidote1911/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8BD7326B6A428F90D844BC3ED74B0682922333EBE6B4557278EF72DE9E36BA73')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"    
    make INSTALL_ROOT="${pkgdir}/" install
}
