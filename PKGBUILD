# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=upd72020x-fw
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="Renesas uPD720201 / uPD720202 USB 3.0 chipsets firmware"
arch=('any')
url="https://github.com/denisandroid/uPD72020x-Firmware"
license=('custom')
source=(
  "uPD72020x-Firmware-$pkgver.tar.gz::https://codeload.github.com/denisandroid/uPD72020x-Firmware/tar.gz/refs/tags/$pkgver"
  "remove.hook"
)
sha512sums=(
  '9d7e61c99a0f46d0ae96505317e763a468d3e8006f7398d10899ab78532b1ace608662b8a1b410a5577b268dc1f9275d1ebe3d03d209b85b2c4307ceb48dd261'
  '47aa4c4c3a0014df79b7a7998edfbc7b436ae6e966432f3787d9f1655c986591c73165de6fad52ebb5cefd4f8101b9b094d117f0508cd1f8f0d2c7396bbd3f91'
)

package() {
  install -Dm644 "uPD72020x-Firmware-$pkgver/UPDATE.mem" "$pkgdir/usr/lib/firmware/renesas_usb_fw.mem"
  install -Dm644 "uPD72020x-Firmware-$pkgver/License.rtf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rtf"

  # firmware install & remove hooks
  install -Dm644 /dev/null "$pkgdir/usr/lib/initcpio/hooks/$pkgname"
  install -Dm644 remove.hook "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
