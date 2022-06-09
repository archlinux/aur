# Maintainer: taotieren <admin@taotieren.com>
_pkgname=QSerial
pkgname=qserial
pkgver=1.1
pkgrel=1
pkgdesc="The missing cross platform serial port utility with batteries included."
arch=('any')
url="https://github.com/tuna/QSerial"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=('libusb' 'qt6-webengine' 'qt6-serialport')
makedepends=()
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::https://github.com/tuna/${_pkgname}/archive/v${pkgver}.zip"
    "${pkgname}.desktop")
sha256sums=('5565958b131c7b4df8f015bb5c0079022a0b37c93e7092539c9a55909fe81636'
            '1683f6d64933dcc2d2e044e997206ce68cfbc1d1330018c5d8e2beb7790e7827')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    qmake ${pkgname}.pro
    make
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
