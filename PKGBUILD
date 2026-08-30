# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee-compat
pkgver=0.6.90b432
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers (pre-Haswell CPU build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-compat::${url}/releases/download/v${pkgver}/lilbee-compat-linux-${CARCH}")
sha256sums_x86_64=('15e10b4ea300d103b98bbaed76d0c27ecdfffb1c022f5bf193d2f0ccb658c020')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-compat" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
