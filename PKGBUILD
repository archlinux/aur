# Author: Emil Lundberg <lundberg.emil@gmail.com>.

pkgname=shared-cryptboot-utils
pkgver=1.1.0
pkgrel=1
pkgdesc="Utilities for having boot files on a shared encrypted device"
arch=('any')
license=('GPL')
source=(
  shared-cryptboot-build.hook
  shared-cryptboot-mount.hook
  shared-cryptboot-unmount.hook
  shared-cryptboot-build
)
sha256sums=('5dd4951e1a2956591f87d37122b843758698dd459c67d6e3e0c04a420cb6a193'
            'cbd642928c74eecd6d9cdc44783c6b0952e636f53759435cc118e13033a364d1'
            'cf1e18ee6493d95353963973277ad7723c2a190535bdcb50151dc697ecdaf09e'
            'b9631cfdf7ce42cff93edc06fbfc80b659e2043130b9f7ba6decd5786b351a1b')

package() {
  install -D -m 444 "${srcdir}"/shared-cryptboot-build.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-build.hook
  install -D -m 444 "${srcdir}"/shared-cryptboot-mount.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-mount.hook
  install -D -m 444 "${srcdir}"/shared-cryptboot-unmount.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-unmount.hook
  install -D -m 555 "${srcdir}"/shared-cryptboot-build "${pkgdir}"/usr/share/libalpm/scripts/shared-cryptboot-build
}
