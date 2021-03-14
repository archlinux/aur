# Maintainer: taotieren <admin@taotieren.com>
_pkgname=QSerial
pkgname=qserial
pkgver=1.0
pkgrel=2
pkgdesc="The missing cross platform serial port utility with batteries included."
arch=('any')
url="https://github.com/tuna/QSerial"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=('libusb' 'qt5-webengine' 'qt5-serialport')
makedepends=()
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.zip::https://github.com/tuna/${_pkgname}/archive/v${pkgver}.zip"
    "${pkgname}.desktop")
sha256sums=(
    'f30de8390e2f8a80d98872105e177cec773a36c637a126aa3e72b412e711ba6b'  
    '1683f6d64933dcc2d2e044e997206ce68cfbc1d1330018c5d8e2beb7790e7827'
)

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    qmake ${pkgname}.pro
    make
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
