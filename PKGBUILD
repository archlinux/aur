# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="v24.0.0"
pkgrel=1
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
sha256sums=('0d609958635672b23d7caccf887fcda913fb6132f008efb2a8cf61f922a2385b'
            'de9159969fca39ce888a6350660bbae418be1a26016c6c421bf90719e733a1a3'
            '895f5821423a480b5f96ac53869e087129c010ed05998006ccf1b3ea11530d59'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=("wofi-pass.1.gz")

package() {
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.conf" -t "${pkgdir}/etc"
    install -Dm644 "${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
