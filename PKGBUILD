# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee
pkgver=0.6.66b495
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
replaces=('lilbee-bin')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}")
sha256sums_x86_64=('6c07d8a8c2d6c75d6595a174cf1fe49ae48ecf34d148a180713283098bb45f2a')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
