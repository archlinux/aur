# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="v24.0.2"
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
sha256sums=('193c80fd45610db166ed792a8f3f635fb8012e89b9d94d0055c9e96d3cf94962'
            'de9159969fca39ce888a6350660bbae418be1a26016c6c421bf90719e733a1a3'
            'ae04e662027adc49b8b692567b3a85255bfa05a06d64951935f3427c7fe38d82'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=("wofi-pass.1.gz")

package() {
    install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.conf" -t "${pkgdir}/etc"
    install -Dm644 "${srcdir}/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
