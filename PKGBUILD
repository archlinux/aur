# Maintainer: K900 <me@0upti.me>
_pkgname=windows2usb
pkgname=${_pkgname}-git
pkgver=0.1.5
pkgrel=4

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
    "139be9b1db2fa227590a26b15a380e1fa5855436521db7365953d80d8ec3935fb427248c5de8ed5f90846f4b3946d7bdb6cdab326a2016d8d51721e612b70c9b"
)

package() {
    install -Dm644 $srcdir/uefi-ntfs.img "$pkgdir/usr/share/$_pkgname/uefi-ntfs.img"
    install -Dm755 $srcdir/$_pkgname/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
