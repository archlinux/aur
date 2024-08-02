# Maintainer: she11sh0cked <22623152+she11sh0cked@users.noreply.github.com>

pkgname=firefox-webserial
pkgver=0.3.2
pkgrel=1
pkgdesc='Native connector for WebSerial API in Firefox'
arch=('x86_64')
url='https://github.com/kuba2k2/firefox-webserial'
license=('MIT')
depends=('firefox')
source=(
    "${pkgname}-${pkgver}::https://github.com/kuba2k2/firefox-webserial/releases/download/v${pkgver}/firefox-webserial-linux-x86-64"
    "io.github.kuba2k2.webserial.json"
)
sha256sums=('d710b19b1ad1997bba4c15997ce72d0658658244e3f90bac93dd4cb5b6a393c6'
            'e92b1d6a2f617446cb85aeabdff9058b06c5beea1311a753444374aadf5e10f5')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/io.github.kuba2k2.webserial.json" "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/io.github.kuba2k2.webserial.json"
}
