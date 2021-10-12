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
  "d4b8bd93d9701c5f8dfa91376c19ad406c911dfbc91b428d3e0e5d85315976d4e88b4d8115fca61a67454133d831a2cfe6cc3fdfe4fce117ceeb44aa606170c5"
  "e2c28ed08ea2c85c27e9a64e177d1652d4975f22c33850b0622099315f06b9a0d5c2d16191be6ed168d1a06873fa99b4b74d71177755433da80310d4966d4212"
  "a54dd8f4007d60c8163c813fbb8545842ba0ed2004e8c3fcca0522fd985c43cd23805731faa92483ea0fd0f1423c9120fc6ef0ddd41e3bad3c344edce1f63c8f"
)
b2sums=(
  "4dda24fdaa39207c23179578505ab7bb3380c18054a5026644c5e2a954a987f96d75e581f590942978e84d92c2b3dbb4fd77b5002a19914bedd625ba3cb70b83"
  "37a47b18ce0a51c066de1acaa55d4900de8fc22871b474008356d5ff17234cf177d57107672c8b80319f374c1694bc6bce0853e326bf3a0be29e5d8a72f12d5b"
  "501e64a231f3e48f6d205199857ef12931a5dd50edede9dae7d8147b2d60458240300ac461ce1ceb4fda4c6c665f53bd2bab9d6ef4d01a531113e2684e646db5"
)
b3sums=(
  "e2f9b734d6434f41189742e5b979da3a8be641713e791cd77b47a4c9b82adeb8"
  "58c3c7f5b496a39782ae79eb443dc1d4e5b1bc843e66f65e97d1226affe96a86"
  "0a60f2d0b70c7e91fd851ea8f3955f1905a801bc1df37418868889f5e8c13e8c"
)

package () {
  install -Dm755 "${srcdir}/build_kernel.sh" "${pkgdir}/usr/bin/build_kernel.sh"
  install -Dm644 "${srcdir}/kernel-update.hook" "${pkgdir}/etc/pacman.d/hooks/efi-kernel-update.hook"
}
