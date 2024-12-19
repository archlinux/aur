# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="v24.1.0"
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
sha256sums=('4efe10f6f77076bd094f0393bf4e80a90c53896b18584f6100c88d8f879a1d09'
            'c3823bad9074e92f197d621f0adb8619ad060f406ce6f9aff290b7cc842fa432'
            '23d1ed62ae8c4e1b53a3d22b20d9edbcb46013e61a2d1f3ff9e28f2124d57d2e'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
noextract=("wofi-pass.1.gz")

package() {
    install -Dm755 "${srcdir}/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.conf" -t "${pkgdir}/etc"
    install -Dm644 "${srcdir}/${pkgname}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
