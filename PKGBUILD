# Maintainer: andrew-ld <andrew-ld at protonmail dot com>

pkgname=rtl8761b-firmware
_pkgname=${pkgname%-git}
_reponame=rtl8761b-firmware
pkgver=162105963
pkgrel=1
pkgdesc="old firmware for rtl8761b, new firmware have stability problems when used with xbox controller"
arch=('any')
url="https://github.com/andrew-ld/rtl8761b-firmware"
license=('custom')
depends=('linux-firmware')
makedepends=('git')
source=("git+https://github.com/andrew-ld/rtl8761b-firmware.git" "LICENSE")
md5sums=('SKIP' '673efaa2188a637ba065de22c9fd4c0b')

package() {
    install -D -m644 "$_reponame/rtl8761b_config.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_config.bin"
    install -D -m644 "$_reponame/rtl8761b_fw.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"
    install -D -m644 "$_reponame/rtl8761bu_config.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761bu_config.bin"
    install -D -m644 "$_reponame/rtl8761bu_fw.bin" "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761bu_fw.bin"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
