# Contributor: Robert Csordas <xdever@gmail.com>
pkgname=arch-efiboot
pkgver=1.2
pkgrel=1
arch=("any")
url="https://github.com/xdever/arch-efiboot"
depends=("binutils" "pacman")
license=('Apache')
pkgdesc="Builds bootable UEFI blobs (including kernel, initrd, ucode, cmdline) in /boot directory "
install="${pkgname}.install"
source=(
  "build_kernel.sh"
  "install.sh"
  "kernel-update.hook"
)
sha512sums=(
  "1672b6c508a4ac9105d6291480c72de1871cfb0aa6e396e168a38cb1d49016913023cfb52bd7e9c0009f6a6eed6f115c52fd00cbe4355cc317d95a0f0699c21c"
  "e2c28ed08ea2c85c27e9a64e177d1652d4975f22c33850b0622099315f06b9a0d5c2d16191be6ed168d1a06873fa99b4b74d71177755433da80310d4966d4212"
  "a54dd8f4007d60c8163c813fbb8545842ba0ed2004e8c3fcca0522fd985c43cd23805731faa92483ea0fd0f1423c9120fc6ef0ddd41e3bad3c344edce1f63c8f"
)
b2sums=(
  "c1c8d8d55624bae8688a20b47f88e989727403dab81fdd12e7f2f0e6fb47dd9d94e9aebc9980969df4f31b4ec119778468f6c9013d9d40dc03f8cbce45fa07bb"
  "37a47b18ce0a51c066de1acaa55d4900de8fc22871b474008356d5ff17234cf177d57107672c8b80319f374c1694bc6bce0853e326bf3a0be29e5d8a72f12d5b"
  "501e64a231f3e48f6d205199857ef12931a5dd50edede9dae7d8147b2d60458240300ac461ce1ceb4fda4c6c665f53bd2bab9d6ef4d01a531113e2684e646db5"
)
b3sums=(
  "001ebb699fdd49a09a3e79560696f160c9b043ed126dd9df8966864e0c4f9c6b"
  "58c3c7f5b496a39782ae79eb443dc1d4e5b1bc843e66f65e97d1226affe96a86"
  "0a60f2d0b70c7e91fd851ea8f3955f1905a801bc1df37418868889f5e8c13e8c"
)

package () {
  install -Dm755 "${srcdir}/build_kernel.sh" "${pkgdir}/usr/bin/build_kernel.sh"
  install -Dm644 "${srcdir}/kernel-update.hook" "${pkgdir}/etc/pacman.d/hooks/efi-kernel-update.hook"
}
