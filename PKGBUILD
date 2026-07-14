pkgname=rpi5-uefi-bin
_release="test1"
pkgdesc="EDK2 firmware images for Raspberry Pi 5"
pkgver=0.0.0.${_release}
pkgrel=1
arch=('aarch64')
url="https://github.com/NumberOneGit/rpi5-uefi"
license=(
  BSD-2-Clause-Patent
  BSD-3-Clause
)
depends=()
makedepends=()
checkdepends=()
source=(
"https://github.com/NumberOneGit/rpi5-uefi/releases/download/${_release}/RPI_EFI.fd"
"edk2.license.txt::https://raw.githubusercontent.com/tianocore/edk2/refs/heads/master/License.txt"
"atf.license.rst::https://raw.githubusercontent.com/ARM-software/arm-trusted-firmware/refs/heads/master/docs/license.rst"
)
b2sums=('15f944a488992060360bc1ac2fd2a6b41a2e5a9ca15a8da8f344e491852f37024a58fe458bd4e7f4b5b984b5a9c3c55397649d6753d12d4c09508137d6eaa0bc'
        '554c83b831d3c1b30bc6eebb7724f3d7c3b33197ea6edbe506167f5bd965d783128efd1730f53849d1da6fb9227381bcb6427808dee4b51eb231e3737e67dd20'
        'aa42c0888cf777855e4fd83cca14d44be2b0b168c8438ce9d2c1e0e94587fa539ebd7f58ce938012ca9ee6993c9329b4d296a15553896b9dd1a5958b5bb6d0c6')

package() {
  mkdir "${pkgdir}"/boot
  cp RPI_EFI.fd "${pkgdir}"/boot/.
  install -vDm 644 edk2.license.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 atf.license.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
}

