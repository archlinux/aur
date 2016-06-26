# Author: Emil Lundberg <lundberg.emil@gmail.com>.

pkgname=shared-cryptboot-utils
pkgver=1.0.0
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
            '5cbe670efb0863c433c9c0e20dbba969e8679e028e1fbba69f81e9b395de3714'
            '7bd9067a71d410f0c13c3816eef56dcf2f4a07b621ea47186e6d1e6e88e2c909'
            '7816db0e31df365852a8041bc04c841c12a4e705bebd9659ea4b89772a82fe2d')

package() {
  install -D -m 444 "${srcdir}"/shared-cryptboot-build.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-build.hook
  install -D -m 444 "${srcdir}"/shared-cryptboot-mount.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-mount.hook
  install -D -m 444 "${srcdir}"/shared-cryptboot-unmount.hook "${pkgdir}"/usr/share/libalpm/hooks/shared-cryptboot-unmount.hook
  install -D -m 555 "${srcdir}"/shared-cryptboot-build "${pkgdir}"/usr/share/libalpm/scripts/shared-cryptboot-build
}
