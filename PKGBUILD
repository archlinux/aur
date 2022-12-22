# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=mkinitcpio-firmware
pkgver=1.4.0
pkgrel=1
pkgdesc="Optional firmware for the default linux kernel to get rid of the annoying 'WARNING: Possibly missing firmware for module:' messages"
arch=("any")
url="https://aur.archlinux.org/packages/mkinitcpio-firmware"
license=("GPL")

#see https://wiki.archlinux.org/title/mkinitcpio#Possibly_missing_firmware_for_module_XXXX
depends=(
    "linux-firmware"
    "ast-firmware"            # ast
    "aic94xx-firmware"        # aic94xx
    "linux-firmware-qlogic"   # bfa qed qla2xxx qla1280
    "linux-firmware-bnx2x"    # bnx2x
    "linux-firmware-liquidio" # liquidio
    "linux-firmware-mellanox" # mlxsw_spectrum
    "linux-firmware-nfp"      # nfp
    "wd719x-firmware"         # wd719x
    "upd72020x-fw"            # xhc_pic
)
optdepends=(
  "mkinitcpio: build the initramfs"
  "linux: default linux preset"
)
source=(
    mkinitcpio-firmware.hook
)
sha512sums=(0a04b74bbaf7f2e38b6d54214c09c55f00db00e4266c3c970040cbe20c8d2102f536c14279a32c8faa1503dcd8e39f13f79a5332ab023d3b46e36e43912cfe88)

package() {
    install -Dm644 "mkinitcpio-firmware.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
