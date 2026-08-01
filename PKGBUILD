# Maintainer: M. Damian "G'lek" Mulligan <glek (at) glektarssza (dot) com>
# Contributor: Jack Chen <redchenjs@live.com>

pkgname=upd72020x-fw-bin
pkgver=1.1.0
pkgrel=2
epoch=1
pkgdesc="Renesas uPD720201 / uPD720202 USB 3.0 chipsets firmware"
arch=('any')
url="https://git.disroot.org/glektarssza/aur-upd72020x-fw"
license=('custom')
_tarballver=1.0.0
source=(
    "uPD72020x-Firmware-$_tarballver.tar.gz::https://git.disroot.org/glektarssza/aur-upd72020x-fw/releases/download/v1.0.0-3/uPD72020x-Firmware-$_tarballver.tar.gz"
    'validator'
    "remove.hook"
)
sha512sums=(
    '9d7e61c99a0f46d0ae96505317e763a468d3e8006f7398d10899ab78532b1ace608662b8a1b410a5577b268dc1f9275d1ebe3d03d209b85b2c4307ceb48dd261'
    '47aa4c4c3a0014df79b7a7998edfbc7b436ae6e966432f3787d9f1655c986591c73165de6fad52ebb5cefd4f8101b9b094d117f0508cd1f8f0d2c7396bbd3f91'
)

package() {
    install -Dm644 "uPD72020x-Firmware-$_tarballver/UPDATE.mem" "$pkgdir/usr/lib/firmware/renesas_usb_fw.mem"
    install -Dm644 "uPD72020x-Firmware-$_tarballver/License.rtf" "$pkgdir/usr/share/licenses/upd72020x-fw-bin/LICENSE.rtf"

    # firmware install & remove hooks
    install -Dm644 /dev/null "$pkgdir/usr/lib/initcpio/hooks/upd72020x-fw-bin"
    install -Dm644 remove.hook "$pkgdir/usr/share/libalpm/hooks/upd72020x-fw-bin.hook"
}

