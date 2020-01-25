# Maintainer: Steven Xu <stevendoesstuffs@protonmail.com>

pkgname=systemd-keyscript
pkgver=1.0.0
pkgrel=1
pkgdesc='Keyscript service for systemd-cryptsetup + mkinitcpio hook'
url='https://gitlab.com/StevenDoesStuffs/systemd-keyscript'
arch=('any')
license=('MIT')
depends=('mkinitcpio')
source=("sd-keyscript"
        "systemd-keyscript@.service")
sha256sums=('570b3cbc0e0e25d9ee829ac7874a14b235694cfe4f04d0dbf0b9fd609f9adca7'
            '9b6ff4eaa76f02d4d1cda3328791c15cb778ba3b8e6793bd27cc4348fa901a5b')

package() {
    mkdir -p "$pkgdir/etc/systemd-keyscript/initramfs/scripts"
    mkdir -p "$pkgdir/etc/systemd-keyscript/scripts"
    install -D -m 0644 systemd-keyscript@.service "$pkgdir/usr/lib/systemd/system/systemd-keyscript@.service"
    install -D -m 0644 sd-keyscript "$pkgdir/usr/lib/initcpio/install/sd-keyscript"
}
