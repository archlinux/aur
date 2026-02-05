# Maintainer: gnakw <gnakw@outlook.com>
pkgname=bluetooth-voice-box-auto-connect
pkgver=0.1.0
pkgrel=1
pkgdesc="A script to automatically reconnect bluetooth speakers/headphones after system sleep"
arch=('any')
url="" 
license=('GPL')
depends=('bluez' 'bluez-utils' 'bash')
install=$pkgname.install
source=("$pkgname.sh" "${pkgname}.service" "${pkgname}-from-sleep.sh") 
sha256sums=('aadb1fe91b76c0b2c8c6d4d102320a63b94bf007258cce2241ddf5c34495886d' 
'63e829ff91221e797efb8b808b905fa1a4106089e9c6afd68d85d68bab806d8d' 
'bbcc15de980d1b45a9248cb39bd1cd98af7c353f968320c32f2d674100b443b2')

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    install -dm755 "${pkgdir}/usr/lib/systemd/system/"
    install -m644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    
    install -dm755 "${pkgdir}/usr/lib/systemd/system-sleep/"
    install -m755 "${srcdir}/${pkgname}-from-sleep.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-from-sleep"
}

