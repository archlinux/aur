# Maintainer: K900 <me@0upti.me>
_pkgname=windows2usb
pkgname=${_pkgname}-git
pkgver=0.1.5
pkgrel=3

pkgdesc="Windows 7/8/8.1/10 ISO to Flash Drive burning utility for Linux (MBR/GPT, BIOS/UEFI, FAT32/NTFS)"
arch=("any")
url="https://github.com/ValdikSS/windows2usb"
license=("Apache")

depends=("bash" "awk" "ntfs-3g" "dosfstools" "util-linux" "p7zip" "ms-sys")

source=(
    "git+https://github.com/ValdikSS/windows2usb.git"
    "https://github.com/pbatard/rufus/raw/master/res/uefi/uefi-ntfs.img"
)
sha512sums=(
    "SKIP"
    "248cfd5217656f4dec505f38f412fb8a7ecd570d83edf66ac9fbdb8396add311a7d14c15bd628c35049d7001e77365dbea1661d480bce948787b212affa84bdd"
)

package() {
    install -Dm644 $srcdir/uefi-ntfs.img "$pkgdir/usr/share/$_pkgname/uefi-ntfs.img"
    install -Dm755 $srcdir/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
