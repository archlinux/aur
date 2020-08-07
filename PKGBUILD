pkgname=opencore-efi
pkgver=0.6.0
pkgrel=1
_mode='RELEASE'
# _mode='DEBUG'
pkgdesc='OpenCore bootloader to provide supplemental functionality for Apple-specific UEFI drivers'
url='https://github.com/acidanthera/OpenCorePkg'
arch=('x86_64')
license=('BSD')
source=("https://github.com/acidanthera/OpenCorePkg/releases/download/$pkgver/OpenCore-$pkgver-$_mode.zip")
sha256sums=('ca00d9113f67b55e86f1e39513dadf9b27312598ef20ca401bfb048572ea5def')

package(){
  install -d "$pkgdir/boot/EFI"
  cp -a "$srcdir/EFI/OC" "$pkgdir/boot/EFI/"

  install -D "$srcdir/EFI/BOOT/BOOTx64.efi" "$pkgdir/usr/lib/$pkgname/EFI/BOOT/BOOTx64.efi"

  install -d "$pkgdir/usr/share/doc"
  cp -a "$srcdir/Docs" "$pkgdir/usr/share/doc/$pkgname"
}
