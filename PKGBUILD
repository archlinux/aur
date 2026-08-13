# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee-cuda
pkgver=0.6.90b420
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers (CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-cu125::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-cu125")
sha256sums_x86_64=('685975346c99b3f5e25229f71be315bc8172e93ce4e10f2657cd1629f2c731d1')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-cu125" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
