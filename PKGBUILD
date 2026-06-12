# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee-cuda
pkgver=0.6.66b495
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs (CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-cu125::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-cu125")
sha256sums_x86_64=('a73858b343e3aad578045e41f67340358f110b93d3c0bd2b379bdd54143a11e7')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-cu125" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
