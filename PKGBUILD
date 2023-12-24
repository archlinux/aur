# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="v23.1.4"
pkgrel=3
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/schmidtandreas/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=('wtype: type support'
            'pass-otp: OTP support')
source=("${url}/releases/download/${pkgver}/wofi-pass"
        "${url}/releases/download/${pkgver}/wofi-pass.conf"
        "${url}/releases/download/${pkgver}/wofi-pass.1.gz"
        "${url}/releases/download/${pkgver}/LICENSE")
sha256sums=('d77e57a7e2f3c460ff7d5b06f6f14eb568f6eb641de77db7836ce381dbef7584'
            'de9159969fca39ce888a6350660bbae418be1a26016c6c421bf90719e733a1a3'
            '4e79799f0f2ec249e16fe4412c143a226f0367ffb5e92a40baf926d1bb3bd9b4'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=("wofi-pass.1.gz")

package() {
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.conf" -t "${pkgdir}/etc"
    install -Dm644 "${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
