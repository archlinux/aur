# Maintainer: unknowndev <unknowndev at archlinux.info>

pkgname=kiwivm-ga-systemd
pkgver=0.1.1
pkgrel=1
pkgdesc="BandawagonHost KiwiVM Guest Agent systemd unit file"
arch=('any')
url="https://github.com/unknowndevqwq/KiwiVM-GA-systemd"
license=('Apache')
depends=('systemd>=240' 'kiwivm-ga')
install="${pkgname}.install"
conflicts=('kiwivm-ga-sysvinit')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
    kiwivm-ga-systemd.install)
sha512sums=('b7153fdf53ab4c10efc94b60176a9ae63fab58262e91339837e256622275bc1967b4d790d01d092f78559d67eef4ec90dcef7b63b31bd34feccb2956b175a01b'
            '37ccf3cc7e603f096ff32584f6f81a43582e60d9bbba6c0318b1c26ca22bd28eee619d1ee18750916e3089bc47ecc8fbfa8e5b458e0cd0d7523493f0da288ff0')
package() {
    cd "KiwiVM-GA-systemd-${pkgver}"
    sed -i '7 s/#Type=exec/Type=exec/'       "qemukvmga.service"
    sed -i '8 s/Type=simple/#Type=simple/'   "qemukvmga.service"
    install -Dm644 "qemukvmga.service" -t    "${pkgdir}/usr/lib/systemd/system"
}
