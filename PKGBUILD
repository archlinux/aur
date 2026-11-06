# Maintainer: tobocop <tobias@lilbee.sh>
pkgname=lilbee-compat-cuda
pkgver=0.6.90b692
pkgrel=1
pkgdesc="The whole local AI stack in one executable: run and manage local AI models, and search your files, code, and crawled web pages, with cited answers (pre-Haswell CPU, CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('MIT')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-compat-cu124::${url}/releases/download/v${pkgver}/lilbee-compat-linux-${CARCH}-cu124")
sha256sums_x86_64=('e3537da9a622333e52349bf9c366e54ba8f87ce9359ee3e17ff6e8a8a2c2925c')
source=("lilbee.service::${url}/raw/v${pkgver}/packaging/systemd/lilbee.service")
sha256sums=('8987137080f5b5353ca4a5bc82aa56c92c450c158e8558fa48fa8bff2cb1c69d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-compat-cu124" "${pkgdir}/usr/bin/lilbee"
    install -Dm644 "${srcdir}/lilbee.service" "${pkgdir}/usr/lib/systemd/user/lilbee.service"
}
