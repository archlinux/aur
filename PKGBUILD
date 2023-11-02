# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="v23.1.2"
pkgrel=1
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/schmidtandreas/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=('wtype: type support'
            'pass-otp: OTP support')
source=("${url}/releases/download/${pkgver}/wofi-pass"
        "${url}/releases/download/${pkgver}/wofi-pass.1.gz"
        "${url}/releases/download/${pkgver}/LICENSE")
sha256sums=('835405139b842f6e71ed0cf2eaa12392deb33a0d7abf5c2c99f745ff2410e1c4'
            '68030ba058cd5951532d43e45072ecc88c1f3a23073ac09327f50c2843c17afb'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=("wofi-pass.1.gz")

package() {
    install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
