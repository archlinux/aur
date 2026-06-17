# Maintainer: Fabian Berg <fabian.berg@hb9hil.org>
pkgname=mtban-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='MikroTik address-list manager via RouterOS REST API (pre-built binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/hb9hil/mtban'
license=('MIT')
provides=('mtban')
conflicts=('mtban')
backup=('etc/mtban/mtban.conf')
source=("mtban.1::https://raw.githubusercontent.com/hb9hil/mtban/v${pkgver}/mtban.1"
        "mtban.conf.example::https://raw.githubusercontent.com/hb9hil/mtban/v${pkgver}/mtban.conf.example"
        "LICENSE::https://raw.githubusercontent.com/hb9hil/mtban/v${pkgver}/LICENSE")
source_x86_64=("mtban::https://github.com/hb9hil/mtban/releases/download/v${pkgver}/mtban-amd64")
source_aarch64=("mtban::https://github.com/hb9hil/mtban/releases/download/v${pkgver}/mtban-arm64")
source_armv7h=("mtban::https://github.com/hb9hil/mtban/releases/download/v${pkgver}/mtban-armhf")
sha256sums=('bbee95aa528829d7afbc74744c265fe32cc01aa94037d5caacd5a41612aa7b04'
            '9cd1bbf814dfada7f83a7eda2982f0ada42c7e228e42b28b2171ca7a07fd95fb'
            '25193699bd9cffa17d645b6b6a5242d36b3205b812e882145785142a931bee3f')
sha256sums_x86_64=('a7dbad63a1636e97853f30e941c0c7ccda1cf0959cc6772a20f773f528d20e23')
sha256sums_aarch64=('a7dbad63a1636e97853f30e941c0c7ccda1cf0959cc6772a20f773f528d20e23')
sha256sums_armv7h=('a7dbad63a1636e97853f30e941c0c7ccda1cf0959cc6772a20f773f528d20e23')

package() {
    install -Dm755 mtban                  "${pkgdir}/usr/bin/mtban"
    install -Dm644 mtban.1                "${pkgdir}/usr/share/man/man1/mtban.1"
    install -Dm600 mtban.conf.example     "${pkgdir}/etc/mtban/mtban.conf"
    install -Dm644 LICENSE                "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
