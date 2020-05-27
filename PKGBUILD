# Maintainer: Fabrice Corraire <antidote1911@gmail.com>

pkgname=arsenic
pkgver=2.8
pkgrel=2
pkgdesc="Qt5 app for encrypt files and text with triple encryption"
arch=('x86_64')
url="https://github.com/Antidote1911/${pkgname}"
license=('GPL')
depends=('qt5-base')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/Antidote1911/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('2DC9E5ED435095BBF75F98907C67F12081BE1401B73A0CB131CA2B623A065C58')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5 QMAKE_DEFAULT_INCDIRS="" ${pkgname}.pro
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"    
    make INSTALL_ROOT="${pkgdir}/" install
}
