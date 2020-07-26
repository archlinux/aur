pkgname=opencore-efi
pkgver=0.5.9
pkgrel=1
pkgdesc='OpenCore bootloader to provide supplemental functionality for Apple-specific UEFI drivers'
url='https://github.com/acidanthera/OpenCorePkg'
arch=('x86_64')
license=('BSD')
source=("https://github.com/acidanthera/OpenCorePkg/releases/download/$pkgver/OpenCore-$pkgver-RELEASE.zip")
sha256sums=('54781875a7620efd32cc334a117984e8755b0e55565f9a65bb79f424fc758289')

package(){
  install -d "$pkgdir/boot/EFI"
  cp -a "$srcdir/EFI/OC" "$pkgdir/boot/EFI/"

  install -D "$srcdir/EFI/BOOT/BOOTx64.efi" "$pkgdir/usr/lib/$pkgname/EFI/BOOT/BOOTx64.efi"

  install -d "$pkgdir/usr/share/doc"
  cp -a "$srcdir/Docs" "$pkgdir/usr/share/doc/$pkgname"
}
