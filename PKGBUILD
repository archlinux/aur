# Maintainer: dlock
pkgname=deepcool-lm
pkgver=1.0.0
pkgrel=2
pkgdesc="Linux driver for Deepcool LM series AIO coolers with LCD display (tested on LM360)"
arch=('any')
url="https://github.com/daedlock/deepcool-lm"
license=('MIT')
depends=(
    'python'
    'python-pyusb'
    'python-psutil'
    'python-pillow'
    'lm_sensors'
)
backup=('etc/systemd/system/deepcool-lm.service')
install=deepcool-lm.install
source=(
    "deepcool-lm"
    "deepcool-lm.service"
)
sha256sums=('SKIP'
            'SKIP')

package() {
    # Install the CLI tool
    install -Dm755 "${srcdir}/deepcool-lm" "${pkgdir}/usr/local/bin/deepcool-lm"

    # Install systemd service
    install -Dm644 "${srcdir}/deepcool-lm.service" "${pkgdir}/etc/systemd/system/deepcool-lm.service"
}
