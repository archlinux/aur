# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee-cuda
pkgver=0.6.90b430
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers (CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-cu125::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-cu125")
sha256sums_x86_64=('d46b2fcf7c1cbd2b8356351ac2842fe887e8967710a56a57fe097a70a1e2f83c')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-cu125" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
