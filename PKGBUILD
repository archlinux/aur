# Maintainer: Jan Kocka <kockahonza@gmail.com>
pkgname=asus-vivobook-rgb-keyboard
pkgver=1
pkgrel=1
pkgdesc="Enables OOBE mode for RGB keyboard control on ASUS Vivobook S 16"
arch=(any)
url="https://github.com/kockahonza/${pkgname}"
license=("GPL")
depends=("systemd" "bash")
source=("${pkgname}.service" "${pkgname}.sh")
sha256sums=('4125d32e3a078576b90151ce1d154f24b2933d442346912bbc949d14ba55dc64'
            'c3fae1cad34c69922f3fc98046b9b378b6d0f0f1237cf32bcd203dc65849cd03')
install=${pkgname}.install

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/${pkgname}.sh"

    mkdir -p "${pkgdir}/etc/systemd/system"
    cp "${srcdir}/${pkgname}.service" "${pkgdir}/etc/systemd/system"
}
