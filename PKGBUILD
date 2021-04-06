# Maintainer: Vladimir Gorbunov <truedaemon@gmail.com>
pkgname=logitech-27mhz-keyboard-encryption-setup
pkgver=0.1
pkgrel=2
pkgdesc="A tool for enabling encryption on the 27 MHz wireless connection used by some (somewhat older) Logitech wireless keyboards."
arch=('x86_64' 'i686')
url="https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup"
license=('GPL2')
groups=()
depends=('libusb')
source=(https://gitlab.freedesktop.org/jwrdegoede/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
noextract=()
sha256sums=('4443c49e38a0d3d2e2ef79982e2b54483a9b8180bda319b40ab9d37ae5919662')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    install -D "lg-27MHz-keyboard-encryption-setup" "${pkgdir}/usr/bin/lg-27MHz-keyboard-encryption-setup"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
