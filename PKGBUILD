# Maintainer: iridiumR <i@iridium.cyou>
pkgname=timeshift-systemd-timer
pkgver=0.0.1
pkgrel=2
pkgdesc="Add systemd support for timeshift"
arch=("any")
license=("GPL3")
depends=('systemd' 'timeshift')
source=(
    local://timeshift-boot.service
    local://timeshift-boot.timer
    local://timeshift-hourly.service
    local://timeshift-hourly.timer
)
sha256sums=('ad3ef6848f42b69c9f0b1c9b5b385993658eba55169d7051082cba362b75938f'
            '513e92bfd5fe5a0fd45d5a3ac3207762f70da9a85d59fd9aeee641e91ef9cc5d'
            '5d72dd147c6b89253aa8e20426b2f2f2d2361957bdea17811e238a60b2cfcdfa'
            'd7a308a962234656fee3cd14d0a19bed2b0c437efb8358fabfb40c0791ddafb0')

package() {
    install -m755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m644 ${srcdir}/* ${pkgdir}/usr/lib/systemd/system
}

