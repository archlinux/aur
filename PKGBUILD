# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee
pkgver=0.6.90b691
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
replaces=('lilbee-bin')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}")
sha256sums_x86_64=('9d03c60eb8e4ee95a8343667c437a1dfcc0b93569b416b3c268a4ed60d3b6f55')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
