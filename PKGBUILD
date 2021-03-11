# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=mkinitcpio-firmware
pkgver=1.1.0
pkgrel=1
pkgdesc="Optional firmware for the default linux kernel to get rid of the annoying 'WARNING: Possibly missing firmware for module:' messages"
arch=("any")
url="https://aur.archlinux.org/packages/mkinitcpio-firmware"
license=("GPL")
depends=(
    "aic94xx-firmware" # aic94xx
    "wd719x-firmware"  # wd719x
    "upd72020x-fw"     # xhc_pic
)
optdepends=(
  "mkinitcpio: build the initramfs"
  "linux: default linux preset"
  "linux-firmware: default linux firmware"
)
source=(
    mkinitcpio-firmware.hook
)
sha512sums=(372d684c586ec2331c5d98885dde3398c8d4a055e391ac7c605144c2ec3dfb49076633010432cb780bfcdeb46833fe85f478b3a6ccb524aeee58102186073117)

package() {
    install -Dm644 "mkinitcpio-firmware.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
