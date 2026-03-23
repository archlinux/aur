# Maintainer: dalmatheo <aur@dalmatheo.dev>

pkgname=procon2-driver-bin
pkgver=0.0.2
pkgrel=5
pkgdesc="An unofficial Nintendo Switch™ 2 Pro Controller driver."
arch=('x86_64')
url="https://github.com/dalmatheo/procon2-driver"
license=('MIT')

# These dependencies are based on namcap analysis of the pre-compiled binary.
depends=(
    'libusb'
    'glibc'
)

provides=("procon2-driver")
conflicts=("procon2-driver")

# !debug is used because this is a pre-compiled binary; we cannot generate debug symbols.
options=('!debug')

source=(
    "https://github.com/dalmatheo/procon2-driver/releases/download/v${pkgver}/procon2-driver-v${pkgver}"
    "https://raw.githubusercontent.com/dalmatheo/procon2-driver/main/LICENSE"
    "https://raw.githubusercontent.com/dalmatheo/procon2-driver/main/procon2-driver.service"
)

package() {
    install -Dm755 "${srcdir}/procon2-driver-v${pkgver}" "${pkgdir}/usr/bin/procon2-driver"
    install -Dm644 "${srcdir}/procon2-driver.service" "${pkgdir}/usr/lib/systemd/system/procon2-driver.service"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha256sums=('cf48fae30f4fa66ac1336c135ea64398185f553113a1d8cbd8199f48ee9cbe27'
            'c97983a0117fee05fbc11415b4c04501a08e3b59150157d9cece33ddf8503a41'
            '849b35b260f48464191b251223854bd572b9fb774e7e83ead5e94b1c6114d3b3')
