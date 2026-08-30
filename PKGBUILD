# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee-rocm
pkgver=0.6.90b431
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers (ROCm build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-rocm::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-rocm")
sha256sums_x86_64=('f43e408b512dc6c9dcd1aa494e9331f824b5772b70a16fbb7e6230ef7ba01025')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-rocm" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
