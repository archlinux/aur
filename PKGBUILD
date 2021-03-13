# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=rtl8761b-fw
pkgver=20201202
pkgrel=1
pkgdesc="Realtek bluetooth firmware for RTL8761B based devices"
arch=('any')
url="https://www.xmpow.com/pages/download"
license=('unknown')
source=(
  "https://mpow.s3-us-west-1.amazonaws.com/mpow_BH519A_driver+for+Linux.7z"
)
sha512sums=(
  '94b45a07c3a2e0650e64b1b52bd2b0b35546b7073dc7c8850b319d164adb66bf41e6d7fa0a20a7170ca264922e4780ea09205332d60eb5037994615303ce7307'
)

package() {
  cd "$srcdir/${pkgver}_LINUX_BT_DRIVER/rtkbt-firmware/lib/firmware/rtlbt"

  install -Dm644 rtl8761b_fw "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_fw.bin"
  install -Dm644 rtl8761b_config "$pkgdir/usr/lib/firmware/rtl_bt/rtl8761b_config.bin"

  echo 'options btusb enable_autosuspend=0' | install -Dm644 /dev/stdin "$pkgdir/etc/modprobe.d/btusb.conf"
}
